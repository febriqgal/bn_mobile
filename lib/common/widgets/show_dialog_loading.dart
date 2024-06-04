import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/colors.dart';

Future<dynamic> showDialogLoading(BuildContext context) => showDialog(
      traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
      barrierDismissible: false,
      useRootNavigator: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingAnimationWidget.discreteCircle(
                color: AppColors.primaryColor,
                secondRingColor: AppColors.primaryColor.withOpacity(0.5),
                thirdRingColor: AppColors.primaryColor.withOpacity(0.1),
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
