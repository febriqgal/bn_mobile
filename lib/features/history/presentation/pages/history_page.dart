import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/text_styles.dart';

class HistoryPage extends ConsumerWidget {
  static const bool isRoot = true;
  static const String name = "history";
  static String get path => isRoot ? '/$name' : name;

  const HistoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History Transaksi'),
      ),
      body: ListView.builder(
        itemCount: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onTap: () {},
          leading: CircleAvatar(
            child: Text("${index + 1}"),
          ),
          title: Text(
            'Transaksi ${index + 1}',
            style: AppTextStyles.textBase.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Rp. ${index + 1}.000.000',
            style: AppTextStyles.textXs,
          ),
          trailing: Text('${index + 1}/${index + 1}/${index + 1}'),
        ),
      ),
    );
  }
}
