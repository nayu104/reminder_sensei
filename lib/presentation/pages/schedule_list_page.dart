import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_reminder/presentation/providers/post_providers.dart';
import 'package:todo_reminder/presentation/widgets/schedule_post_card.dart';

class ScheduleListPage extends ConsumerWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(pendingPostsProvider);
    return asyncPosts.when(
      data: (posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => SchedulePostCard(post: posts[index]),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('読み込みに失敗しました: $e')),
    );
  }
}
