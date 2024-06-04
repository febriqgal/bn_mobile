import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../search/data/models/services_model.dart';
import '../providers/get_service_by_query_group_controller.dart';
import 'modal_feature_widget.dart';

class BayarService extends ConsumerWidget {
  const BayarService({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(GetServiceByQueryGroupProvider('bayar'));
    return ShowModalIconService(
      titleModal: "Pilih Metode Bayar",
      titleIcon: 'Bayar',
      iconPath: 'bayar',
      colorIcon: Colors.white,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: res.length,
        itemBuilder: (context, index) {
          res.sort((a, b) => a.toString().compareTo(b.toString()));
          final data = ServicesModel.fromJson(res[index]);
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: AppColors.primaryColor,
            ),
            child: GestureDetector(
              onTap: () {
                context.pop();
                data.pathName != "/" ? context.push(data.pathName) : null;
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppIcon(
                      path: data.icon,
                      color: Colors.white,
                      size: 60,
                    ),
                    Text(
                      data.title,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
