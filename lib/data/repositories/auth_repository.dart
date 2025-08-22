import 'package:firebase_auth/firebase_auth.dart';

// 認証関連のリポジトリ
class AuthRepository {
  AuthRepository() : _auth = FirebaseAuth.instance;

  //FirebaseAuthインスタンスを取得, 念のため再代入を許さないfinalを用いる
  final FirebaseAuth _auth;

  //ユーザーの認証状態を監視するストリームを返す
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  // メール/パスワードでログイン
  Future<UserCredential> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // メール/パスワードで新規登録
  Future<UserCredential> signUpWithEmailPassword({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // パスワードリセットメールを送信
  Future<void> sendPasswordResetEmail({required String email}) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  // ログアウト
  Future<void> signOut() {
    return _auth.signOut();
  }
}
