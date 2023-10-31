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
  final String imageUrl;

  Contact(this.name, this.number, this.imageUrl);
}

class ContactsPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('João', '+55 11 91234-5678', 'https://picsum.photos/40/40?1'),
    Contact('Maria', '+55 21 98765-4321', 'https://picsum.photos/40/40?2'),
    Contact('Pedro', '+55 48 87654-3210', 'https://picsum.photos/40/40?3'),
    Contact('Ana', '+55 71 76543-2109', 'https://picsum.photos/40/40?4'),
    Contact('Luiz', '+55 51 65432-1098', 'https://picsum.photos/40/40?5'),
    Contact('Mariana', '+55 85 54321-0987', 'https://picsum.photos/40/40?6'),
    Contact('Rafael', '+55 31 43210-9876', 'https://picsum.photos/40/40?7'),
    Contact('Camila', '+55 81 32109-8765', 'https://picsum.photos/40/40?8'),
    Contact('Carlos', '+55 62 21098-7654', 'https://picsum.photos/40/40?9'),
    Contact('Larissa', '+55 27 10987-6543', 'https://picsum.photos/40/40?10'),
    Contact('Antônio', '+55 41 10987-6543', 'https://picsum.photos/40/40?11'),
    Contact('Isabela', '+55 32 65432-1098', 'https://picsum.photos/40/40?12'),
    Contact('Paulo', '+55 49 98765-4321', 'https://picsum.photos/40/40?13'),
    Contact('Vitória', '+55 47 91234-5678', 'https://picsum.photos/40/40?14'),
    Contact('Diego', '+55 32 10987-6543', 'https://picsum.photos/40/40?15')
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
        final contact = contacts[index];
        return ListTile(
          leading: ClipOval(
            child: Image.network(
              contact.imageUrl,
              width: 40,
              height: 40,
            ),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.number),
          onTap: () {
            Navigator.pushNamed(context, '/chat', arguments: contact);
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
    final Contact contact =
        ModalRoute.of(context)!.settings.arguments! as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.network(
              contact.imageUrl,
              width: 40,
              height: 40,
            ),
            ),
            Text('Name: ${contact.name}'),
            Text('Phone number: ${contact.number}'),
          ],
        ),
      ),
    );
  }
}

