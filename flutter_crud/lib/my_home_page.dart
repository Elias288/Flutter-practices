import 'package:flutter/material.dart';
import 'package:flutter_application_1/contact_class.dart';
import 'package:flutter_application_1/modify_contact.dart';
import 'package:flutter_application_1/register_contact.dart';

import 'message_response.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  const MyHomePage(this._title, {super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<Contact> contacts = [Contact('Will', '099044224', 'Mora')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyContact(contacts[index])))
                    .then((newContact) {
                  if (newContact != null) {
                    setState(() {
                      contacts.removeAt(index);
                      contacts.insert(index, newContact);
                      messageResponse(
                          context, "${newContact.name} has been modified");
                    });
                  }
                });
              },
              onLongPress: () {
                removeContact(context, contacts[index]);
              },
              title: Text("${contacts[index].name} ${contacts[index].surname}"),
              subtitle: Text(contacts[index].phone),
              leading: CircleAvatar(
                child: Text(contacts[index].name.substring(0, 1)),
              ),
              trailing: const Icon(
                Icons.call,
                color: Colors.red,
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const RegisterContact()))
              .then((newContact) => {
                    if (newContact != null)
                      {
                        setState(() {
                          contacts.add(newContact);
                          messageResponse(context, "has been saved");
                        })
                      }
                  });
        },
        tooltip: "Add contact",
        child: const Icon(Icons.add),
      ),
    );
  }

  removeContact(BuildContext context, Contact contact) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Delete Contact"),
              content:
                  Text("Are you shure to delete the contact ${contact.name}?"),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        contacts.remove(contact);
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("Delete",
                        style: TextStyle(color: Colors.red))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",
                        style: TextStyle(color: Colors.blue)))
              ],
            ));
  }
}
