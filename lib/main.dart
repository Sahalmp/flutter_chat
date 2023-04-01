import 'package:flutter/material.dart';
import 'package:flutter_chat/chat.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Group Chat'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Chats',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              ListTile(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const NameDialog();
                    },
                  );
                },
                tileColor: Colors.white,
                title: const Text('GROUP 1'),
                leading: const CircleAvatar(
                  child: Icon(Icons.group),
                ),
              ),
              const Divider(),
            ],
          ),
        ));
  }
}

class NameDialog extends StatefulWidget {
  const NameDialog({super.key});

  @override
  _NameDialogState createState() => _NameDialogState();
}

class _NameDialogState extends State<NameDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter your name"),
      content: TextField(
        controller: _nameController,
        decoration: const InputDecoration(hintText: "Name"),
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            String name = _nameController.text;
            if (name.isNotEmpty) {
              print(name);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
              // Do something with the name
              // Navigator.pop(context);
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
