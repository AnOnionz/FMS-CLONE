import 'package:flutter/material.dart';

class CustomerField extends StatefulWidget {
  final bool isRequired;
  final String label;
  final Widget? child;
  final Function(dynamic value) onChanged;
  const CustomerField(
      {super.key,
      required this.isRequired,
      required this.label,
      this.child,
      required this.onChanged});

  @override
  State<CustomerField> createState() => _CustomerFieldState();
}

class _CustomerFieldState extends State<CustomerField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
