import 'package:flutter/material.dart';
import 'package:todo_reminder/domain/entities/post.dart';
import 'package:todo_reminder/presentation/formatters/date_formatters.dart';

class SchedulePostCard extends StatelessWidget {
  const SchedulePostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.text),
        subtitle: Row(
          children: [
            Text(formatYmdE(post.scheduledAt)),
          ],
        ),
      ),
    );
  }
}
