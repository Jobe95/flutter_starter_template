import 'package:flutter/material.dart';
import 'package:jobe_template/core/constants/app_constants.dart';

class AutoCompleteSearchTextField extends StatefulWidget {
  const AutoCompleteSearchTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = '',
    this.items = const [],
    required this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final Function(String value) onChanged;
  final List<String> items;

  @override
  State<AutoCompleteSearchTextField> createState() =>
      _AutoCompleteSearchTextFieldState();
}

class _AutoCompleteSearchTextFieldState
    extends State<AutoCompleteSearchTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  OverlayEntry? _overlayEntry;

  bool _isFocused = false;
  List<String> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _overlayEntry?.dispose();
    super.dispose();
  }

  void setIsFocused(bool value) {
    setState(() {
      _isFocused = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final disabledColor = Theme.of(context).disabledColor;
    final primary = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMediumPadding)
          .copyWith(top: kSmallPadding),
      child: Column(
        children: [
          Focus(
            onFocusChange: setIsFocused,
            focusNode: _focusNode,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _focusNode.hasFocus
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          color: _controller.text.isNotEmpty
                              ? primary
                              : disabledColor,
                        ),
                        onPressed: () {
                          if (_controller.text.isEmpty) {
                            _focusNode.unfocus();
                            return;
                          }
                          setState(() {
                            _controller.clear();
                            _suggestions.clear();
                            hideOverlay();
                          });
                          widget.onChanged(_controller.text);
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: _isFocused ? primary : disabledColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: disabledColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: primary,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _suggestions = widget.items
                      .where((str) =>
                          str.toLowerCase().contains(value.toLowerCase()) &&
                          value.isNotEmpty)
                      .toList();
                  if (_isFocused && _suggestions.isNotEmpty) {
                    _showOverlay();
                  } else {
                    hideOverlay();
                  }
                });
                widget.onChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    var height = MediaQuery.of(context).size.height;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (context) => StatefulBuilder(
          builder: (context, setState) {
            return Positioned(
              left: kMediumPadding,
              top: offset.dy + size.height + kSmallPadding,
              width: size.width - (kMediumPadding * 2),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: height / 3,
                ),
                child: Material(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kMediumPadding),
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final text = _suggestions[index];
                      return ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(kMediumPadding),
                        ),
                        title: Text(text),
                        onTap: () {
                          setState(() {
                            _controller.text = text;
                            widget.onChanged(text);
                            _focusNode.unfocus();
                            _suggestions.clear();
                            hideOverlay();
                          });
                        },
                      );
                    },
                    itemCount: _suggestions.length,
                  ),
                ),
              ),
            );
          },
        ),
      );
      Overlay.of(context).insert(_overlayEntry!);
    } else if (!_overlayEntry!.mounted) {
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.markNeedsBuild();
    }
  }

  void hideOverlay() {
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry!.remove();
    }
  }
}
