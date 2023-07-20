import 'package:flutter/material.dart';
import 'package:flutter_crud/data/hive_data.dart';
import 'package:flutter_crud/utils/contact.dart';
import 'package:flutter_crud/utils/message_response.dart';
import 'package:flutter_crud/pages/modify_contact.dart';
import 'package:flutter_crud/pages/register_contact.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  const MyHomePage(this._title, {super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  HiveData hd = HiveData();

  @override
  void initState() {
    hd.loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
          itemCount: hd.contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ModifyContact(hd.contacts[index])))
                    .then((newContact) {
                  if (newContact != null) {
                    setState(() {
                      hd.contacts.removeAt(index);
                      hd.contacts.insert(index, newContact);
                      messageResponse(
                          context, "${newContact.name} has been modified");
                    });
                  }
                });
              },
              onLongPress: () {
                removeContact(context, hd.contacts[index]);
              },
              title: Text(
                  "${hd.contacts[index].name} ${hd.contacts[index].surname}"),
              subtitle: Text(hd.contacts[index].phone),
              leading: CircleAvatar(
                child: Text(hd.contacts[index].name.substring(0, 1)),
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
                          hd.contacts.add(newContact);
                          hd.updateDataBase();
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
                        hd.contacts.remove(contact);
                        hd.updateDataBase();
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
