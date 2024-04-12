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

  @override
  String toString() => 'Leave(project: $project, reason: $reason)';
}
