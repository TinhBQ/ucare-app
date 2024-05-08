// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names
part of 'item_dependencies.dart';

class FileItem {
  final String fileName;
  const FileItem({
    required this.fileName,
  });

  factory FileItem.fromJson(Map<String, dynamic> json) {
    return FileItem(
      fileName: json['fileName'] ?? '',
    );
  }
}
