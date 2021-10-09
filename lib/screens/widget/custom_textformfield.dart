import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.title,
    this.hint = '',
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hint;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void _onListener() => setState(() {});
  @override
  void initState() {
    widget.controller.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.title),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
