import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/themes/colors.dart';
import '../../../../common/themes/icons.dart';
import '../../../../common/themes/text_styles.dart';
import '../../../../common/widgets/icon_back_button.dart';
import '../../../../common/widgets/size_screen.dart';
import '../../../../common/widgets/text_form_field.dart';
import '../../data/models/services_model.dart';
import '../providers/services_provider.dart';

class SearchPage extends HookConsumerWidget {
  static const bool isRoot = true;
  static const String name = "search";
  static String get path => isRoot ? '/$name' : name;
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesData = ref.watch(servicesProvider);
    final searchResults = useState([]);
    final queryValue = useState('');
    final queryController = useTextEditingController();
    void onQueryChanged(String q) {
      queryValue.value = q;
      searchResults.value = servicesData
          .where((element) => element['title']
              .toString()
              .toLowerCase()
              .contains(queryValue.value.toLowerCase()))
          .followedBy(servicesData.where((element) => element['group']
              .toString()
              .toLowerCase()
              .contains(queryValue.value.toLowerCase())))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Layanan'),
        centerTitle: true,
        leading: const AppIconBackButton(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: AppTextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: queryController,
              placeholder: "Cari",
              icon: AppIconPath.search,
              onChanged: (value) => onQueryChanged(value),
              suffixIcon: queryValue.value.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        queryValue.value = '';
                        queryController.clear();
                      },
                      icon: const AppIcon(path: AppIconPath.close),
                    )
                  : null,
            ),
          ),
          const Gap(16),
          if (queryValue.value.isNotEmpty && searchResults.value.isEmpty)
            SizedBox(
              height: AppSizeScreen.height(context, 0.5),
              child: const Center(
                child: Text(
                  'Layanan Tidak Ditemukan',
                ),
              ),
            )
          else if (queryValue.value.isNotEmpty &&
              searchResults.value.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        final data =
                            ServicesModel.fromJson(searchResults.value[index]);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.primaryColor.withOpacity(0.2)),
                            child: ListTile(
                              onTap: () => context.push(data.pathName),
                              subtitle: Text(data.group,
                                  style: AppTextStyles.text1xs),
                              leading: AppIcon(
                                path: data.icon,
                              ),
                              trailing: const AppIcon(
                                path: AppIconPath.rightArrow,
                              ),
                              title: Text(data.title,
                                  style: AppTextStyles.textBase),
                            ),
                          ),
                        );
                      },
                      itemCount: searchResults.value.length),
                ),
              ),
            )
          else if (queryValue.value.isEmpty)
            SemuaDataLayanan(servicesData: servicesData),
        ],
      ),
    );
  }
}

class SemuaDataLayanan extends StatelessWidget {
  const SemuaDataLayanan({
    super.key,
    required this.servicesData,
  });

  final List<Map<String, dynamic>> servicesData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ListView.builder(
              itemBuilder: (context, index) {
                final data = ServicesModel.fromJson(servicesData[index]);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.primaryColor.withOpacity(0.2)),
                    child: ListTile(
                      onTap: () => context.push(data.pathName),
                      leading: AppIcon(
                        path: data.icon,
                      ),
                      trailing: const AppIcon(
                        path: AppIconPath.rightArrow,
                      ),
                      title: Text(data.title, style: AppTextStyles.textBase),
                    ),
                  ),
                );
              },
              itemCount: servicesData.length),
        ),
      ),
    );
  }
}
