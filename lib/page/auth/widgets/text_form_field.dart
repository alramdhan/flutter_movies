import 'package:flutter/material.dart';

class MTextFField extends StatefulWidget {
  const MTextFField({
    super.key,
    required this.controller,
    this.obscure = false,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.label,
  });

  final TextEditingController controller;
  final bool obscure;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final String? label;

  @override
  State<MTextFField> createState() => _MTextFFieldState();
}

class _MTextFFieldState extends State<MTextFField> {
  bool _secure = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _secure = widget.obscure;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      validator: (value) => value == null || value.isEmpty ? "This field is required" : null,
      obscureText: _secure,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface
      ),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      onFieldSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      decoration: InputDecoration(
        // label: widget.label == null ? null : Text(widget.label!),
        filled: true,
        labelText: widget.label,
        suffixIcon: widget.obscure
          ? InkWell(
            onTap: () {
              setState(() {
                _secure = !_secure;
              });
            },
            child: Icon(_secure ? Icons.visibility : Icons.visibility_off)
          ) : null,
      ),
    );
  }
}