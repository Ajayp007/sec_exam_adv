import 'package:flutter/material.dart';

class BackupContact extends StatefulWidget {
  const BackupContact({super.key});

  @override
  State<BackupContact> createState() => _BackupContactState();
}

class _BackupContactState extends State<BackupContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.blue,
            ),
            title: const Text("Ajay Purohit"),
            subtitle: const Text("+91 8140986630"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
            ),
          );
        },
      ),
    );
  }
}
