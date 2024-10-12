
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 2')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tab 2'),
            ElevatedButton(
                onPressed: () {
                 /* Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Page2('tab2')));*/
                },
                child: const Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}