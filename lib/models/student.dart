class Student {
  final String name;
  final String studentId;
  bool _isPresent = false;

  Student({
    required this.name,
    required this.studentId,
  });

  bool get isPresent => _isPresent;

  void togglePresence() {
    _isPresent = !_isPresent;
  }

  void reset() {
    _isPresent = false;
  }
}