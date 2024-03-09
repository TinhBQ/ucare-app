import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/presentation/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listNews = [
      const CustomSlideNews(
          title:
              'Chương trình tư vấn: Kiểm soát hiệu quả đau do lạc nội mạc tử cung',
          content:
              "Trung tâm Truyền thông phối hợp cùng Khoa Phụ sản Bệnh viện đại học Y Dược TPHCM",
          imagePath: 'assets/logo/test.jpg'),
      const CustomSlideNews(
          title:
              'Chương trình tư vấn: Kiểm soát hiệu quả đau do lạc nội mạc tử cung',
          content:
              "Trung tâm Truyền thông phối hợp cùng Khoa Phụ sản Bệnh viện đại học Y Dược TPHCM",
          imagePath: 'assets/logo/test.jpg'),
      const CustomSlideNews(
          title:
              'Chương trình tư vấn: Kiểm soát hiệu quả đau do lạc nội mạc tử cung',
          content:
              "Trung tâm Truyền thông phối hợp cùng Khoa Phụ sản Bệnh viện đại học Y Dược TPHCM",
          imagePath: 'assets/logo/test.jpg'),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 36, bottom: 30),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: const CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage('assets/logo/no-image.png'),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text(
                      'Chào mừng đến với',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      ' ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'U Care',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '0358913075',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ]),
            ]),
          ),
          Flexible(
            flex: 1,
            child: GridView.count(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              childAspectRatio: (1 / .4),
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              children: [
                CustomCategoryCard(
                  title: 'Đặt khám',
                  icon: Icons.local_hospital,
                  onPressed: () {
                    print('object');
                  },
                ),
                CustomCategoryCard(
                  title: 'Lịch sử đặt khám',
                  icon: Icons.file_copy_outlined,
                  onPressed: () {
                    print('object');
                  },
                ),
                CustomCategoryCard(
                  title: 'Đặt lịch uống thuốc',
                  icon: Icons.medication_liquid,
                  onPressed: () {
                    print('object');
                  },
                ),
                CustomCategoryCard(
                  title: 'Theo dõi sức khỏe',
                  icon: Icons.monitor_heart,
                  onPressed: () {
                    print('object');
                  },
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tin tức nổi bật',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  CarouselSlider(
                      items: listNews,
                      options: CarouselOptions(
                          height: 264,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              myCurrentIndex = index;
                            });
                          },
                          viewportFraction: 1)),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: myCurrentIndex,
                      count: listNews.length,
                      effect: const WormEffect(
                        dotWidth: 8,
                        dotHeight: 8,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
