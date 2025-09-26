import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vietlite/app/res/res.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/di/locator.shorten.dart';
import 'button.dart';

class DialogBody extends StatelessWidget {
  final Widget? body;
  final String? title;
  final String? content;
  final String? buttonName;
  final String? buttonName2;
  final VoidCallback? onTap;
  final VoidCallback? onTap2;
  final double? width;
  final bool barrierDismissible;

  const DialogBody({
    super.key,
    this.title,
    this.body,
    this.content,
    this.buttonName,
    this.onTap,
    this.buttonName2,
    this.onTap2,
    this.width,
    this.barrierDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: context.color.foreground,
        borderRadius: BorderRadius.circular(8),
      ),
      width: width ?? size.width / 4,
      child:
          (body != null)
              ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: body!,
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child:
                        (barrierDismissible)
                            ? InkWell(
                              onTap: () {
                                AppLocator.router.maybePop();
                              },
                              child: CircleAvatar(
                                backgroundColor: context.color.neutral.shade200,
                                radius: 14,
                                child: Icon(
                                  Icons.close,
                                  size: 14,
                                  color: context.color.neutral,
                                ),
                              ),
                            )
                            : const SizedBox(),
                  ),
                ],
              )
              : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.bell),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title ?? context.lang.notice,
                          style: context.defaultStyle.s20.semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      (barrierDismissible)
                          ? InkWell(
                            onTap: () {
                              AppLocator.router.maybePop();
                            },
                            child: const Icon(Icons.close, size: 24),
                          )
                          : const SizedBox(),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 12),
                  Text(content ?? '', textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                  (buttonName2 == null)
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Button.primary(
                              buttonName: buttonName ?? context.lang.ok,
                              onPressed:
                                  onTap ??
                                  () {
                                    AppLocator.router.maybePop();
                                  },
                            ),
                          ),
                        ],
                      )
                      : Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Button.primary(
                              buttonName: buttonName ?? context.lang.ok,
                              onPressed:
                                  onTap ??
                                  () {
                                    AppLocator.router.maybePop();
                                  },
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: Button.primary(
                              buttonName: buttonName2!,
                              onPressed:
                                  onTap2 ??
                                  () {
                                    AppLocator.router.maybePop();
                                  },
                            ),
                          ),
                        ],
                      ),
                ],
              ),
    );
  }
}

void showAppDialog({
  barrierDismissible = true,
  Widget? body,
  String? content,
  String? buttonName,
  String? buttonName2,
  String? titleName,
  VoidCallback? onTap,
  VoidCallback? onTap2,
  double? width,
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: DialogBody(
          body: body,
          title: titleName,
          buttonName: buttonName,
          buttonName2: buttonName2,
          content: content,
          onTap: onTap,
          onTap2: onTap2,
          width: width,
          barrierDismissible: barrierDismissible,
        ),
      );
    },
  );
}
