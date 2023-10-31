import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Color(0xFF128C7E),
        scaffoldBackgroundColor: Color(0xFFECE5DD),
      ),
      home: ContactsPage(),
      routes: {
        '/contacts': (context) => ContactsPage(),
        '/chat': (context) => ChatPage(),
      },
    ));

class Contact {
  final String name;
  final String number;

  Contact(this.name, this.number);
}

class ContactsPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('João', '+55 11 91234-5678'),
    Contact('Maria', '+55 21 98765-4321'),
    Contact('Pedro', '+55 48 87654-3210'),
    Contact('Ana', '+55 71 76543-2109'),
    Contact('Luiz', '+55 51 65432-1098'),
    Contact('Mariana', '+55 85 54321-0987'),
    Contact('Rafael', '+55 31 43210-9876'),
    Contact('Camila', '+55 81 32109-8765'),
    Contact('Carlos', '+55 62 21098-7654'),
    Contact('Larissa', '+55 27 10987-6543'),
    Contact('Antônio', '+55 41 10987-6543'),
    Contact('Isabela', '+55 32 65432-1098'),
    Contact('Paulo', '+55 49 98765-4321'),
    Contact('Vitória', '+55 47 91234-5678'),
    Contact('Diego', '+55 32 10987-6543')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All my chats'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].number),
            onTap: () {
              Navigator.pushNamed(context, '/chat', arguments: contacts[index]);
            },
          );
        },
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Contact contato =
        ModalRoute.of(context)!.settings.arguments! as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text(contato.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text('Name: ${contato.name}'),
            Text('Phone number: ${contato.number}'),
          ],
        ),
      ),
    );
  }
}
