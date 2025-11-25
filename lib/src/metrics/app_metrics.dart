abstract class MetricsClient {
  Future<void> trackEvent(String eventName, [Map<String, dynamic>? props]);
}

class AppMetrics {
  final MetricsClient _client;

  AppMetrics({required MetricsClient client}) : _client = client;

  Future<void> trackEvent(
    String eventName, [
    Map<String, dynamic>? props,
  ]) async {
    await _client.trackEvent(eventName, props);
  }

  /// Starts a timer for an event and returns a function to stop it and track the event.
  Future<void> Function([Map<String, dynamic>? props]) timeEvent(
    String eventName,
  ) {
    final stopwatch = Stopwatch()..start();
    return ([Map<String, dynamic>? props]) async {
      stopwatch.stop();
      final durationMs = stopwatch.elapsedMilliseconds;
      final properties = props ?? {};
      properties['duration_ms'] = durationMs;
      await _client.trackEvent(eventName, properties);
    };
  }
}
