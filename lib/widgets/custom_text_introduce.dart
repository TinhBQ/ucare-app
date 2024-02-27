import 'package:flutter/material.dart';

class CustomTextIntroduce extends StatelessWidget {
  final String description;

  const CustomTextIntroduce({super.key, required this.description});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Image(
                    image: 
                    AssetImage('assets/logo/logo.png'),
                    width: 68,
                    height: 68, 
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chào mừng đến với', style: Theme.of(context).textTheme.headlineMedium,),
                    Text(
                      'U Care', 
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(description, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.secondary),),
        ),
      ],
    );
  }
  
}