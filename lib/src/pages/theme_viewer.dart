import 'package:flutter/material.dart';
import 'package:flutter_utils/src/pages/theme/buttons_page.dart';
import 'package:flutter_utils/src/pages/theme/color_page.dart';
import 'package:flutter_utils/src/pages/theme/inputs_page.dart';
import 'package:flutter_utils/src/pages/theme/selections_page.dart';
import 'package:flutter_utils/src/pages/theme/text_page.dart';

/// Page for [Theme] perview
class ThemeViewerPage extends StatelessWidget {
  const ThemeViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[
      ButtonsPage(),
      InputsPage(),
      SelectionsPage(),
      TextPage(),
      DebugColorPage(),
    ];

    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Preview'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.touch_app),
                text: 'Buttons',
              ),
              Tab(
                icon: Icon(Icons.keyboard),
                text: 'Inputs',
              ),
              Tab(
                icon: Icon(Icons.select_all),
                text: 'Selections',
              ),
              Tab(
                icon: Icon(Icons.text_fields),
                text: 'Text',
              ),
              Tab(
                icon: Icon(Icons.color_lens),
                text: 'Colors',
              ),
            ],
          ),
        ),
        endDrawer: _Drawer(),
        body: const TabBarView(
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: _BottomNavigationBar(),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Drawer header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currIndex,
      onTap: (index) => setState(() => _currIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }
}
