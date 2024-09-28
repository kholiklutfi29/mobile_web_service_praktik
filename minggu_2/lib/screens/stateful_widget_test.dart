import 'package:flutter/material.dart';

class TestStatefulWidget extends StatefulWidget {
  const TestStatefulWidget({super.key});

  @override
  State<TestStatefulWidget> createState() => _TestStatefulWidgetState();
}

class _TestStatefulWidgetState extends State<TestStatefulWidget> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: isClick == true ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                isClick == true ? 'This is blue' : 'This is red',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isClick = !isClick;
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Text(
            'Click Me',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
