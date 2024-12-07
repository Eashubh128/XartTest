import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:xarttest/views/custom_widgets/match_result_sheet.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom sheet test'),
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Wrap(
                    children: [
                      MatchResultSheet(backgroundColor: const Color(0xFF47902e))
                    ],
                  );
                });
          },
          child: const Text(
            'Open sheet',
          ),
        ),
      ),
    );
  }
}
