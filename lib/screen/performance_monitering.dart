import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PerformanceMonitering extends StatefulWidget {
  const PerformanceMonitering({super.key});

  @override
  State<PerformanceMonitering> createState() => _PerformanceMoniteringState();
}

class _PerformanceMoniteringState extends State<PerformanceMonitering> {
  Future<void> someFunction() async {
    final Trace trace = FirebasePerformance.instance.newTrace('custom_trace');
    await trace.start();

    // Code block to measure
    await Future.delayed(Duration(seconds: 2));

    await trace.stop();
  }
  Future<void> fetchData() async {
    // Create a new HttpMetric instance
    final HttpMetric httpMetric = FirebasePerformance.instance.newHttpMetric(
      'https://jsonplaceholder.typicode.com/posts',
      HttpMethod.Get,
    );

    // Start tracking the metric
    await httpMetric.start();

    try {
      // Perform the network request
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      // Firebase Performance will automatically capture the response code and other metrics
      print('Response code: ${response.statusCode}');
    } catch (e) {
      print('Failed to fetch data: $e');
    } finally {
      // Stop the metric
      await httpMetric.stop();
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
