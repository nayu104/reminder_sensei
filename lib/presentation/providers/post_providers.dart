import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_reminder/data/repositories/post_repository.dart';
import 'package:todo_reminder/domain/entities/post.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository();
});

final pendingPostsProvider = StreamProvider<List<Post>>((ref) {
  final repo = ref.watch(postRepositoryProvider);
  return repo.watchByStatus(ReminderStatus.pending);
});

final donePostsProvider = StreamProvider<List<Post>>((ref) {
  final repo = ref.watch(postRepositoryProvider);
  return repo.watchByStatus(ReminderStatus.done);
});
