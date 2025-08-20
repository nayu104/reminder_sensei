import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bottom_nav_provider.dart';

class CommonBottomNavigationBar extends ConsumerWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // タブを等幅で常時表示（4個以上でもOK）。背景色はバー全体で統一
      showUnselectedLabels: true, // 非選択タブのラベルも常に表示（固定タイプと相性が良い）
      currentIndex: currentIndex,
      onTap: (index) {
        ref.read(bottomNavProvider.notifier).state = index;
        vibrate();
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.event), label: '予定'),
        BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: '完了済み'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: '宛先追加'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: '設定'),
      ],
    );
  }
}

void vibrate() {
  HapticFeedback.lightImpact(); // iOS/Android両対応の軽いバイブ
}
