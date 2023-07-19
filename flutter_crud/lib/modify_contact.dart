import 'package:flutter/material.dart';
import 'package:flutter_application_1/contact_class.dart';
import 'package:flutter_application_1/text_box.dart';

class ModifyContact extends StatefulWidget {
  final Contact _contact;
  const ModifyContact(this._contact, {super.key});
  @override
  State<StatefulWidget> createState() => _ModifyContact();
}

class _ModifyContact extends State<ModifyContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurName;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    Contact c = widget._contact;
    controllerName = TextEditingController(text: c.name);
    controllerSurName = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modify contact"),
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
