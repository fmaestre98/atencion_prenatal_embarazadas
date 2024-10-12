import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 3')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tab 3'),
            ElevatedButton(
                onPressed: () {
                 /* Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Page2('tab3')));*/
                },
                child: const Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}