import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:pokemon_app/config/router/router.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MainBlocObserver extends BlocObserver {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

// class FlutterContactsExample extends StatefulWidget {
//   const FlutterContactsExample({super.key});

//   @override
//   _FlutterContactsExampleState createState() => _FlutterContactsExampleState();
// }

// class _FlutterContactsExampleState extends State<FlutterContactsExample> {
//   List<Contact>? _contacts;
//   bool _permissionDenied = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchContacts();
//   }

//   Future _fetchContacts() async {
//     if (!await FlutterContacts.requestPermission(readonly: true)) {
//       setState(() => _permissionDenied = true);
//     } else {
//       final contacts = await FlutterContacts.getContacts();
//       setState(() => _contacts = contacts);
//     }
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(title: const Text('flutter_contacts_example')),
//           body: _body()));

//   Widget _body() {
//     if (_permissionDenied) {
//       return const Center(child: Text('Permission denied'));
//     }
//     if (_contacts == null) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return ListView.builder(
//       itemCount: _contacts!.length,
//       itemBuilder: (context, i) {
//         debugPrint("------------>>>${_contacts![i].socialMedias}");
//         return ListTile(
//             title: Row(
//               children: [
//                 // Image.file(File('${_contacts![i].photo}')),
//                 Text(_contacts![i].displayName),
//               ],
//             ),
//             onTap: () async {
//               final fullContact =
//                   await FlutterContacts.getContact(_contacts![i].id);
//               await Navigator.of(context).push(
//                   MaterialPageRoute(builder: (_) => ContactPage(fullContact!)));
//             });
//       },
//     );
//   }
// }

// class ContactPage extends StatelessWidget {
//   final Contact contact;
//   const ContactPage(this.contact, {super.key});

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: AppBar(title: Text(contact.displayName)),
//       body: Column(children: [
//         Text('First name: ${contact.name.first}'),
//         Text('Last name: ${contact.name.last}'),
//         Text(
//             'Phone number: ${contact.phones.isNotEmpty ? contact.phones.first.number : '(none)'}'),
//         Text(
//             'Email address: ${contact.emails.isNotEmpty ? contact.emails.first.address : '(none)'}'),
//       ]));
// }
