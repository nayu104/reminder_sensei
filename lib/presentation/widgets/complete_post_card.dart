import 'package:flutter/material.dart';
import 'package:todo_reminder/domain/entities/post.dart';

class CompletePostCard extends StatelessWidget {
  const CompletePostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(
          post.text,
          style: const TextStyle(decoration: TextDecoration.lineThrough),
        ),
        subtitle: Text(
          post.updatedAt?.toLocal().toString() ?? '完了日時不明',
        ),
      ),
    );
  }
}
