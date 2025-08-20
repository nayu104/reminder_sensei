import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_reminder/domain/converters/date_time_converter.dart';

part 'post.freezed.dart';
part 'post.g.dart';

// 通知ステータス: 未完/完了
enum ReminderStatus { pending, done }

@freezed
sealed class Post with _$Post {
  const factory Post({
    required String id,
    required String text,
    required ReminderStatus status,
    required String timezone,
    @DateTimeTimestampConverter() DateTime? updatedAt,
    @DateTimeTimestampConverter() DateTime? createdAt,
    @DateTimeTimestampConverter() DateTime? scheduledAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
