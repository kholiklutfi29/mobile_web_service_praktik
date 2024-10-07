import 'package:demo_api/screens/listview_builder.dart';
import 'package:flutter/material.dart';

class ListviewExample extends StatefulWidget {
  const ListviewExample({super.key});

  @override
  State<ListviewExample> createState() => _ListviewExampleState();
}

class _ListviewExampleState extends State<ListviewExample> {
  bool _switchEnable = true;

  // function to change switch state
  void _onChangeSwitch({required bool value}) {
    setState(() {
      _switchEnable = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView (Default)',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(
                Icons.airplanemode_active_rounded,
              ),
              title: const Text(
                'Airplane Mode',
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Transform.translate(
                offset: const Offset(10.0, 0),
                child: Switch(
                  value: _switchEnable,
                  onChanged: (value) => _onChangeSwitch(value: value),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.wifi_rounded),
              title: Text(
                'Wi-Fi',
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            const ListTile(
              leading: Icon(Icons.bluetooth_rounded),
              title: Text(
                'Bluetooth',
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const ListViewBuilder(),
            ),
          );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
          child: const Icon(
            Icons.arrow_right,
            size: 20,
          ),
        ),
      ),
    );
  }
}
