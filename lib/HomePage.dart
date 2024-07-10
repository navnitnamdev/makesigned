import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step 3: Use the Consumer widget to access data
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${counterProvider.count}',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
             ),
            ),
           floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Step 4: Trigger state update
              counterProvider.increment();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
