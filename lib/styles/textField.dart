import 'package:flutter/material.dart';
import 'package:notes/styles/font.dart';

class NormField extends StatelessWidget {
  final String? hint;
  final String label;
  final TextEditingController? controller;
  // final AppText.body1Color = Colors.white;
  final Icon? icon;

  const NormField(this.label, this.controller, {this.hint, Key? key, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppText.body1Style(),
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
        hintText: hint,
        hintStyle: AppText.body1Style(),
        labelStyle: AppText.body1Style(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}

class passwordField extends StatefulWidget {
  const passwordField(
      {super.key, this.hint, required this.label, this.controller});
  final String? hint;
  final String label;
  final TextEditingController? controller;
  // final AppText.body1Color = Colors.white;
  // final Icon? icon;

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidden,
      // validator: (passwordController) => passwordController!.length <6 ? "Enter min. 5 characters " : null,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      style: AppText.body1Style(),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: togglePasswordVisibility,
            icon:
                isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility)),
        prefixIcon: const Icon(Icons.lock),
        labelText: widget.label,
        hintText: widget.hint,
        hintStyle: AppText.body1Style(),
        labelStyle: AppText.body1Style(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
      ),
    );
  }

  void togglePasswordVisibility()=> setState(() {
    isHidden = !isHidden;
  });
}
