 String nameImage() {
  final time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');
  return 'buildcard_$time.png';
}
