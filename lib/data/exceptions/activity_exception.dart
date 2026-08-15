class ActivityRetrievalException implements Exception {
  final int? statusCode;

  ActivityRetrievalException({this.statusCode});
}
