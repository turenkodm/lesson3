import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:lesson3/pages/add_page.dart';
import 'package:lesson3/pages/delete_page.dart';
import 'package:lesson3/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _navPush(const AddPage());
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _navPush(const DeletePage());
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              _navPush(const SettingsPage());
            },
            icon: const Icon(Icons.settings),
          ),
          TextButton(
            style: TextButton.styleFrom(
                primary: Theme.of(context).colorScheme.onPrimary,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
            child: const Text('Exit'),
          )
        ],
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () => _navPush(const MyApp()),
              child: DrawerHeader(
                padding: const EdgeInsets.only(right: 100),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Container(
                  child: Image.asset('assets/images/1.png'),
                  margin: const EdgeInsets.only(right: 44),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Page'),
              onTap: () => _navPush(const AddPage()),
            ),
            const Divider(thickness: 2),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete Page'),
              onTap: () => _navPush(const DeletePage()),
            ),
            const Divider(thickness: 2),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings Page'),
              onTap: () => _navPush(const SettingsPage()),
            ),
          ],
        ),
      ),
      body: const Center(
          child: Text(
        'Main Page',
        style: TextStyle(fontSize: 30),
      )),
      bottomNavigationBar: _barChoose(),
    );
  }

  void _navPush(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Widget _barChoose () {
    if (Platform.isIOS) {
      return CupertinoTabBar(
        activeColor: Colors.deepOrange,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Delete Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings Page',
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {
          if (index == 0) {
          } else if (index == 1) {
            _navPush(const AddPage());
          } else if (index == 2) {
            _navPush(const DeletePage());
          } else if (index == 3) {
            _navPush(const SettingsPage());
          }
        },
      );
    } else {
      return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'Delete Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings Page',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepOrange,
        onTap: (int index) {
          if (index == 0) {

          } else if (index == 1) {
            _navPush(const AddPage());
          } else if (index == 2) {
            _navPush(const DeletePage());
          } else if (index == 3) {
            _navPush(const SettingsPage());
          }
        },
      );
    }
  }

}
