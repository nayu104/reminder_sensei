import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/bottom_nav_provider.dart';
import '../widgets/common_bottom_navigation_bar.dart';
import 'add_recipient_page.dart';
import 'completed_schedule_list_page.dart';
import 'schedule_list_page.dart';
import 'settings_page.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          ScheduleListPage(),
          CompletedScheduleListPage(),
          AddRecipientPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: const CommonBottomNavigationBar(),
    );
  }
}
