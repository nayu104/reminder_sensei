import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_reminder/presentation/providers/post_providers.dart';
import 'package:todo_reminder/presentation/widgets/complete_post_card.dart';

class CompletedScheduleListPage extends ConsumerWidget {
  const CompletedScheduleListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(donePostsProvider);
    return asyncPosts.when(
      data: (posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => CompletePostCard(post: posts[index]),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('読み込みに失敗しました: $e')),
    );
  }
}
