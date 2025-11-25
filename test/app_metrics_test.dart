import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_logger_metrics/src/metrics/app_metrics.dart';

// Generate mocks
@GenerateMocks([MetricsClient])
import 'app_metrics_test.mocks.dart';

void main() {
  group('AppMetrics Tests', () {
    late MockMetricsClient mockMetricsClient;
    late AppMetrics appMetrics;

    setUp(() {
      mockMetricsClient = MockMetricsClient();
      appMetrics = AppMetrics(client: mockMetricsClient);
    });

    test('trackEvent should call client.trackEvent', () async {
      await appMetrics.trackEvent('test_event', {'key': 'value'});
      verify(
        mockMetricsClient.trackEvent('test_event', {'key': 'value'}),
      ).called(1);
    });

    test(
      'timeEvent should return a function that calls client.trackEvent with duration',
      () async {
        // Mock the stopwatch or just test the flow?
        // Since we can't easily mock Stopwatch without another wrapper, we'll test that it calls trackEvent eventually.
        // For TDD, let's assume we pass a duration provider or just verify the call.

        // A better approach for timeEvent is to return a callback that stops the timer and logs.
        final stopTimer = appMetrics.timeEvent('load_event');
        await Future.delayed(const Duration(milliseconds: 100));
        await stopTimer({'extra': 'data'});

        verify(
          mockMetricsClient.trackEvent(
            'load_event',
            argThat(
              predicate((Map<String, dynamic> props) {
                return props.containsKey('duration_ms') &&
                    props['extra'] == 'data';
              }),
            ),
          ),
        ).called(1);
      },
    );
  });
}
