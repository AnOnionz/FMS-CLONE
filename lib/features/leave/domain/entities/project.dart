// ignore_for_file: public_member_api_docs, sort_constructors_first
class Project {
  final String name;
  DateTime start;
  DateTime end;

  Project({required this.name, required this.start, required this.end});

  Project copyWith({
    String? name,
    DateTime? start,
    DateTime? end,
  }) {
    return Project(
      name: name ?? this.name,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
