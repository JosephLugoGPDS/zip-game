import 'package:app/core/extensions/context_extension.dart';
import 'package:app/core/resources/colors.dart';
import 'package:app/core/widgets/dialog/base_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDialog extends BaseDialog {
  final String title;
  final String description;
  String? acceptButtonText;
  final VoidCallback? onAcceptButton;

  ErrorDialog(
      {this.title = '',
      required this.description,
      this.onAcceptButton,
      this.acceptButtonText});

  @override
  Widget createAcceptButton({BuildContext? context}) {
    return MaterialButton(
      onPressed: () {
        if (onAcceptButton != null) {
          onAcceptButton!();
        }
        try {
          //getIt<FluroRouter>().pop(context!);
          Navigator.pop(context!);
        } catch (e, _) {}
      },
      color: AppColors.errorColor,
      child: Text(acceptButtonText ?? 'Aceptar',
          style: context?.textTheme.titleSmall),
    );
  }

  @override
  Widget? createCancelButton({BuildContext? context}) {
    return null;
  }

  @override
  Widget createDescription() {
    return Text(
      description,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget? createImage() =>
      Icon(Icons.warning, size: 50.h, color: AppColors.errorColor);

  @override
  Widget? createTitle() {
    return Text(
      title,
    );
  }
}
