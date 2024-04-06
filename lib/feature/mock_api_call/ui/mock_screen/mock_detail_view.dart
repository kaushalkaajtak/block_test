import 'package:flutter/material.dart';

class MockDetailView extends StatelessWidget {
  final String id;
  final String title;
  final String body;
  const MockDetailView({
    super.key,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock Detail'),
      ),
      body: Column(children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ]),
    );
  }
}
