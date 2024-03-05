// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'project.dart';

class Leave {
  Project project;
  String? reason;

  Leave({required this.project, this.reason});

  Leave copyWith({
    Project? project,
    String? reason,
  }) {
    return Leave(
      project: project ?? this.project,
      reason: reason ?? this.reason,
    );
  }
}
