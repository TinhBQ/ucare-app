part of 'widget_dependencies.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Color? borderColor;
  final BorderRadius borderRadius; // Thêm borderRadius vào CustomSearchBar
  final void Function(String? text)? onChanged;
  final void Function(String? text)? onSubmitted;
  final void Function()? onTap;
  final void Function()? onClear;
  final bool? isSearching;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.borderColor,
    this.borderRadius = const BorderRadius.all(
        Radius.circular(10.0)), // Thiết lập border radius mặc định
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onClear,
    this.isSearching = false,
  });

  @override
  State<CustomSearchBar> createState() {
    return _CustomSearchBarState();
  }
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _showClearIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
      child: SearchBar(
        controller: widget.controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        shape: MaterialStateProperty.resolveWith((states) {
          return RoundedRectangleBorder(
            borderRadius:
                widget.borderRadius, // Sử dụng borderRadius từ CustomSearchBar
            side: BorderSide(
              color:
                  widget.borderColor ?? Theme.of(context).colorScheme.primary,
              width: states.contains(MaterialState.focused) ? 2.0 : 1.8,
            ),
          );
        }),
        surfaceTintColor: MaterialStateProperty.resolveWith((states) {
          return Colors.transparent;
        }),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          return Colors.transparent;
        }),
        trailing: [
          if (_showClearIcon)
            IconButton(
                onPressed: () {
                  widget.controller.clear();
                  widget.onClear?.call();
                  setState(() {
                    _showClearIcon = false;
                  });
                },
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          widget.isSearching == true
              ? const CustomCircularProgressinDicator()
              : Icon(
                  Icons.search,
                  color: widget.borderColor ??
                      Theme.of(context).colorScheme.primary,
                )
        ],
        hintText: 'Tìm nhanh...',
        autoFocus: false,
        onChanged: (text) {
          setState(() {
            _showClearIcon = text.isNotEmpty;
          });
          widget.onChanged?.call(text);
        },
        onSubmitted: (text) {
          widget.onSubmitted?.call(text);
        },
        onTap: () {
          widget.onTap;
        },
      ),
    );
  }
}
