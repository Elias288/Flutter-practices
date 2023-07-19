import 'package:flutter/material.dart';
import 'package:flutter_application_1/contact_class.dart';
import 'package:flutter_application_1/text_box.dart';

class RegisterContact extends StatefulWidget {
  const RegisterContact({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterContact();
}

class _RegisterContact extends State<RegisterContact> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Name"),
          TextBox(controllerSurName, "SurName"),
          TextBox(controllerPhone, "Phone"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String surname = controllerSurName.text;
                String phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                  Navigator.pop(context, Contact(name, phone, surname));
                }
              },
              child: const Text("Save Contact")),
        ],
      ),
    );
  }
}
