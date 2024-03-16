import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1.2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      // elevation: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: const NetworkImage(
                    'https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-1/429792523_1519344362255641_5860009585417561131_n.jpg?stp=dst-jpg_p480x480&_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFaS9sXRTdKWYjA58MCcRQorNv0J02UWkKs2_QnTZRaQp5cutOK3U3_DeADenzfqBBS0AA76Pfw9BoE7xeTn_hc&_nc_ohc=zBKawJplh58AX8dQSkE&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfBqMlrFmUobriayHPBTDp5vdBSSvkV7nITexxEkLMRcrw&oe=65F801FC'),
                fit: BoxFit.cover,
                height: 111,
                width: 111,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        "Thứ 6, thứ 7, thứ 2",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phan Thị Diễm Trinh".toUpperCase(),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Flexible(
                    child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
