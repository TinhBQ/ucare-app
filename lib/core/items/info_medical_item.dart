class InfoMedicalItem {
  final String id;
  final int numStep;
  final String value;
  final String title;
  final String strIcon;
  final bool disabled;
  final String path;

  InfoMedicalItem({
    this.id = "",
    required this.numStep,
    required this.title,
    required this.path,
    required this.strIcon,
    this.disabled = false,
    required this.value,
  });

  InfoMedicalItem copyWith({
    String? id,
    int? numStep,
    String? value,
    String? title,
    String? strIcon,
    bool? disabled,
    String? path,
  }) {
    return InfoMedicalItem(
      id: id ?? this.id,
      numStep: numStep ?? this.numStep,
      value: value ?? this.value,
      title: title ?? this.title,
      strIcon: strIcon ?? this.strIcon,
      disabled: disabled ?? this.disabled,
      path: path ?? this.path,
    );
  }
}
