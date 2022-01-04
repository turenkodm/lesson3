import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson3/pages/settings_page.dart';

import '../main.dart';
import 'add_page.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navPush(Widget page) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }

    Widget _barChoose() {
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
          currentIndex: 2,
          onTap: (int index) {
            if (index == 0) {_navPush(const MyHomePage());
            } else if (index == 1) {
              _navPush(const AddPage());
            } else if (index == 2) {

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
          currentIndex: 2,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            if (index == 0) {
              _navPush(const MyHomePage());
            } else if (index == 1) {
              _navPush(const AddPage());
            } else if (index == 2) {

            } else if (index == 3) {
              _navPush(const SettingsPage());
            }
          },
        );
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Page'),
      ),
      body: const Center(
        child: Text(
          'Delete Page route',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      bottomNavigationBar: _barChoose(),
    );
  }
}
