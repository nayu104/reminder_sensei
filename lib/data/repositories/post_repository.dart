import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_reminder/domain/entities/post.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firestore の「コレクション」への参照。
  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('posts');

  Stream<List<Post>> watchByStatus(ReminderStatus status) {
    return _collection
        // Firestore のコレクションから「条件付き検索」をするメソッド
        //status フィールドが 'pending' か 'done' と等しいものだけ取ってくる
        .where('status', isEqualTo: status.name)
        // 取得したデータを並び替える。false: 昇順（古い順 → 新しい順）
        .orderBy('scheduledAt', descending: false)
        // データが追加・更新・削除されるたびに新しいスナップショットが流れてくる。
        .snapshots()
        //スナップショットをPostに変換する
        .map((s) => s.docs.map((d) => _fromDoc(d.id, d.data())).toList());
  }

  // Firestore → Post
  Post _fromDoc(String id, Map<String, dynamic> data) {
    return Post.fromJson({
      'id': id,
      ...data,
    });
  }

  Future<void> createPost({
    required String text,
    DateTime? scheduledAt,
    required String timezone,
  }) async {
    await _collection.add({
      'text': text,
      'status': ReminderStatus.pending.name,
      'timezone': timezone,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      if (scheduledAt != null)
        'scheduledAt': Timestamp.fromDate(scheduledAt.toUtc()),
    });
  }
}
