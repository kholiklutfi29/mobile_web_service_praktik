import 'package:flutter/material.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  // teks controller for textfield
  final _confirmationController = TextEditingController();
  bool isConfirmed = false;

  void _checkConfirmation() {
    // check input from user
    if (_confirmationController.text.trim().toLowerCase() == 'yes') {
      setState(() {
        isConfirmed = true;
      });
    } else {
      setState(() {
        isConfirmed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Isi text field dibawah dan tekan tombol untuk melihat gambar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmationController,
                decoration: const InputDecoration(
                  hintText: 'Yes / No', // The hint text
                  hintStyle:
                      TextStyle(color: Colors.red), // Custom style for the hint
                  border:
                      OutlineInputBorder(), // Add a border around the TextField
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _checkConfirmation,
                child: const Text('Confirm'),
              ),
              const SizedBox(
                height: 16,
              ),
              if (isConfirmed)
                Center(
                  child: Image.network(
                    'https://bit.ly/4d8mqZ8',
                    width: 300,
                    height: 300,
                  ),
                )
              else
                const Center(
                  child: Text(
                    "This is the image place",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
