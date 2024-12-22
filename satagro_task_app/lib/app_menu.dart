import 'package:flutter/material.dart';
import 'package:satagro_task_app/features/satellite_map/satellite_map_page.dart';
import 'package:satagro_task_app/features/sliding_table/sliding_table_page.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  int _menuSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SatAgro Task APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('SatAgro Task App'),
        ),
        body: switch (_menuSelectedIndex) {
          0 => const SatelliteMapPage(),
          1 => const SlidingTablePage(),
          _ => const SizedBox.shrink(),
        },
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _menuSelectedIndex,
          onTap: _onMenuOptionClicked,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.satellite),
              label: 'Satellite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              label: 'Table',
            ),
          ],
        ),
      ),
    );
  }

  void _onMenuOptionClicked(int index) {
    setState(() {
      _menuSelectedIndex = index;
    });
  }
}
