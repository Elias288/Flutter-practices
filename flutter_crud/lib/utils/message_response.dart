import 'package:flutter/material.dart';

messageResponse(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text("Informative message"),
            content: Text('The contact $name'),
          ));
}
