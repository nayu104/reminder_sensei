# todo_reminder

シンプルなリマインダー管理アプリ（Flutter）。Firestore に保存された予定を一覧し、作成・完了を行います。将来的に Cloud Functions からメール/LINE 送信を行う構成を想定しています。

## セットアップ

前提: FVM を使用

設計方針：
- HiveローカルDB採用
- ローカルファーストな実装
- Firebase課金対策

