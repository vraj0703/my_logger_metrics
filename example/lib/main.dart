import 'package:flutter/material.dart';
import 'package:my_logger_metrics/my_logger_metrics.dart';
import 'package:my_logger_metrics/flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize with DEV flavor for example
  await MyLoggerMetrics.init(
    config: AppConfig(
      flavor: Flavor.DEV,
      aptabaseAppKey: 'A-DEV-0000000000', // Replace with real key
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Logger & Metrics Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  MyLoggerMetrics.d('Debug button pressed');
                },
                child: const Text('Log Debug'),
              ),
              ElevatedButton(
                onPressed: () {
                  MyLoggerMetrics.i('Info button pressed');
                },
                child: const Text('Log Info'),
              ),
              ElevatedButton(
                onPressed: () {
                  MyLoggerMetrics.e(
                    'Error button pressed',
                    Exception('Test Error'),
                  );
                },
                child: const Text('Log Error'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  MyLoggerMetrics.trackEvent('example_event', {'btn': 'track'});
                },
                child: const Text('Track Event'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final stopTimer = MyLoggerMetrics.timeEvent(
                    'timed_operation',
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  await stopTimer({'status': 'completed'});
                  MyLoggerMetrics.i('Timed operation finished');
                },
                child: const Text('Time Event (1s)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
