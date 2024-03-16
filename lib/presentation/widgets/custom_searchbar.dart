import 'package:flutter/material.dart';

import 'custom_circular_progressin_dicator.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Color? borderColor;
  final void Function(String? text)? onChanged;
  final void Function(String? text)? onSubmitted;
  final void Function()? onTap;
  final bool? isSearching;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.borderColor,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
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
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
      child: SearchBar(
        controller: widget.controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        side: MaterialStateBorderSide.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return BorderSide(
                color:
                    widget.borderColor ?? Theme.of(context).colorScheme.primary,
                width: 1.2);
          } else {
            return BorderSide(
                color:
                    widget.borderColor ?? Theme.of(context).colorScheme.primary,
                width: 1);
          }
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
        autoFocus: true,
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
