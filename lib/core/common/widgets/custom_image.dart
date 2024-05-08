part of 'widget_dependencies.dart';

class CustomImage extends StatelessWidget {
  final String? imageUrl;
  final String? imageStr;
  final String? placeholderStr;
  final double width;
  final double height;
  const CustomImage({
    super.key,
    this.imageUrl,
    this.imageStr,
    this.placeholderStr,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return FadeInImage.assetNetwork(
        placeholder: placeholderStr ?? 'assets/images/placeholder_picture.jpg',
        image: imageUrl!,
        width: width,
        height: height,
        fit: BoxFit.cover, 
        // Adjust the fit as per your requirement
      );
    }

    return Image.asset(
      imageStr ?? 'assets/images/placeholder_picture.jpg',
      width: width,
      height: height,
      fit: BoxFit.cover,
    
    );
  }
}
