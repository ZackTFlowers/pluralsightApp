import 'package:flutter/material.dart';
import 'package:mindful_app2/data/sp_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController txtName = TextEditingController();
  final List<String> _images = ['Lake', 'Mountain', 'Sea', 'Country'];
  String _selectedImage = 'Lake';

  @override
  void initState() {
    super.initState();
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: const InputDecoration(hintText: 'Enter your name'),
            ),
            DropdownButton<String>(
              value: _selectedImage, //default to Lake line 13
              items: _images.map((String value) {
                //map() takes each value in _images, and returns an object of DropdownMenuItem which we convert toList() on line 35
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (newvalue) {
                _selectedImage = newvalue ?? 'Lake';
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveSettings();
        },
        child: const Icon(Icons.save)
        ),
    );
  }

  Future saveSettings() async {
    final SPHelper helper = SPHelper();
    await helper.set_settings(txtName.text, _selectedImage);
  }

  Future<void> getSettings() async {
    final SPHelper helper = SPHelper();
    Map<String, String> settings = await helper.getSettings();
    _selectedImage = settings['image'] ?? 'Lake';
    txtName.text = settings['name'] ?? '';
    setState(() {

      }
    );

  }
}
