import '../../../../common/widgets/size_screen.dart';
import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';
import '../../../search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bayar_service_widget.dart';
import 'beli_service_widget.dart';
import 'ewallet_service_widget.dart';
import 'layanan_service_widget.dart';
import 'multilink_service_widget.dart';
import 'rekku_service_widget.dart';
import 'transfer_service_widget.dart';

class ShortcutService extends HookConsumerWidget {
  const ShortcutService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isHide = useState(true);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => context.push(SearchPage.path),
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.primaryColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  const Gap(16),
                  const AppIcon(
                      path: AppIconPath.search, color: AppColors.primaryColor),
                  const Gap(8),
                  Text(
                    'Cari Layanan',
                    style: AppTextStyles.textXs.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const Gap(16),
          GridView(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              TransferService(),
              BayarService(),
              BeliService(),
              EWalletService(),
              LayananService(),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: isHide.value ? 0 : 86,
            child: GridView(
              padding: const EdgeInsets.only(top: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                RekKuService(),
                MultiLinkService(),
              ],
            ),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                shadowColor: Colors.transparent,
                fixedSize: Size(AppSizeScreen.width(context, 1), 48)),
            icon: AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              turns: isHide.value ? 0.5 : 0.0,
              child: const AppIcon(
                path: AppIconPath.arrowDownClosed,
                color: AppColors.primaryColor,
              ),
            ),
            label: Text(
              isHide.value ? 'Lainnya' : 'Tutup',
              style: const TextStyle(fontSize: 10),
            ),
            onPressed: () => isHide.value = !isHide.value,
          ),
        ],
      ),
    );
  }
}
