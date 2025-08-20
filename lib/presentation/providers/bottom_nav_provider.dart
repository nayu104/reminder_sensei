import 'package:flutter_riverpod/flutter_riverpod.dart';

// BottomNavigationBarの選択状態を管理するプロバイダー
final bottomNavProvider = StateProvider<int>((ref) => 0);
