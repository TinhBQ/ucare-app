import 'package:flutter/material.dart';

class ProfileShortWidget extends StatelessWidget {
  final String name;
  final String email;
  final String avatar;
  const ProfileShortWidget({
    super.key,
    required this.name,
    required this.email,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage(avatar),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(999), // Độ cong của viền
              border: Border.all(
                color: Colors.black, // Màu của viền
                width: 2, // Độ dày của viền
              ),
            ),
            child: IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, EditProfileScreen.routeName);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
