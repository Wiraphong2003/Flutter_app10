import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/models/index.dart';

import 'Services.dart';
import 'UserDetail.dart';
import 'models/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(microseconds: milliseconds), action);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final debouncer = Debouncer(milliseconds: 1000);
  Users? users;
  String? title;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    title = 'Loading users ...';
    users = Users();

    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        title = widget.title;
        isLoading = false;
      });
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemCount: users!.users == null ? 0 : users!.users.length,
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
      ),
    );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(users!.users[index].img)),
              title: Text(
                users!.users[index].name,
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 16.0),
              ),
              subtitle: Text(
                "Email: ${users!.users[index].email}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 14.0),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserDetail(
                          user: users!.users[index],
                        )));
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       content: Column(
                //         children: [
                //           const SizedBox(height: 50),
                //           CircleAvatar(
                //             backgroundImage:
                //                 NetworkImage(users!.users[index].img),
                //           ),
                //           Text(users!.users[index].name),
                //           Text(users!.users[index].phone),
                //         ],
                //       ),
                //     );
                //   },
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTF() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(
            5.0,
          )),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Filter by name or email',
      ),
      onChanged: (String) {
        debouncer.run(() {
          setState(() {
            title = "Searching ...";
          });
          Services.getUsers().then((usersFromServer) {
            setState(() {
              users = Users.filterList(usersFromServer, String);
              title = widget.title;
            });
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 56, 3, 83),
          title: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    searchTF(),
                    list(),
                  ],
                ),
        ));
  }
}
