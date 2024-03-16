import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFF625B71)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    50), // Điều chỉnh bán kính bo tròn ở đây
                child: Image.network(
                  'https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-1/429792523_1519344362255641_5860009585417561131_n.jpg?stp=dst-jpg_p480x480&_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFaS9sXRTdKWYjA58MCcRQorNv0J02UWkKs2_QnTZRaQp5cutOK3U3_DeADenzfqBBS0AA76Pfw9BoE7xeTn_hc&_nc_ohc=zBKawJplh58AX8dQSkE&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfBqMlrFmUobriayHPBTDp5vdBSSvkV7nITexxEkLMRcrw&oe=65F801FC',
                  width: 35, // Điều chỉnh kích thước ở đây
                  height: 35,
                  fit: BoxFit
                      .cover, // Tuỳ chọn để điều chỉnh việc căn chỉnh hình ảnh
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Phan Thị Diễm Trinh",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 1,
            clipBehavior: Clip.antiAlias,
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.outline),
          ),
          const SizedBox(height: 8),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    text: 'TÂM THẦN KINH ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                    children: [
                      TextSpan(
                        text:
                            '(Người < 16 tuổi, vui lòng chọn khám BS Phan Thị Diễm Trinh)',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              "Thứ 6, thứ 7",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
