import 'package:flutter/material.dart';

import 'package:mobile_advanced_project_fe/core/utils/utils.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _HomepageState();
}

class _HomepageState extends State<TestPage> {
  @override
  void initState() {
    listenToNotifications();
    super.initState();
  }

//  to listen to any notification clicked or not
  listenToNotifications() {
    print("Listening to notification");
    LocalNotifications.onClickNotification.stream.listen((event) {
      print(event);
      Navigator.pushNamed(context, '/another', arguments: event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Local Notifications")),
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  LocalNotifications.showSimpleNotification(
                    title: "Simple Notification",
                    body: "This is a simple notification",
                    payload: "This is simple data",
                    id: 0,
                  );
                },
                label: const Text("Simple Notification"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.timer_outlined),
                onPressed: () {
                  LocalNotifications.showPeriodicNotifications(
                      title: "Periodic Notification",
                      body: "This is a Periodic Notification",
                      payload: "This is periodic data",
                      id: 1);
                },
                label: const Text("Periodic Notifications"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.timer_outlined),
                onPressed: () {
                  LocalNotifications.scheduleRepeatingNotification(
                    title: "Schedule Notification",
                    body: "This is a Schedule Notification",
                    payload: "This is schedule data",
                    hour: 21,
                    minute: 50,
                    numRepeat: 10,
                    id: 45,
                  );
                },
                label: const Text("Schedule Notifications"),
              ),
              // to close periodic notifications
              ElevatedButton.icon(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    LocalNotifications.cancel(1);
                  },
                  label: const Text("Close Periodic Notifcations")),
              ElevatedButton.icon(
                  icon: const Icon(Icons.delete_forever_outlined),
                  onPressed: () {
                    LocalNotifications.cancelAll();
                  },
                  label: const Text("Cancel All Notifcations"))
            ],
          ),
        ),
      ),
    );
  }
}
