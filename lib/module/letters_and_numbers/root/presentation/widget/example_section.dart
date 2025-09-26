import 'package:flutter/material.dart';
import 'package:vietlite/app/res/res.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/module/letters_and_numbers/root/domain/character_example.dart';
import 'package:vietlite/widget/audio_button.dart';
import 'package:vietlite/widget/alert_dialog.dart';

class ExampleSection extends StatelessWidget {
  final List<CharacterExample> examples;

  const ExampleSection({super.key, required this.examples});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        double widthImage = maxWidth / 2;

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: examples.length,
          separatorBuilder:
              (context, index) => SizedBox(height: AppDimensions.s8),
          itemBuilder: (context, index) {
            final example = examples[index];
            return Container(
              height: context.exampleSectionHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.s8),
                color: context.color.neutral.shade300,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showAppDialog(
                        context: context,
                        width:
                            (context.isTablet)
                                ? MediaQuery.of(context).size.width / 2
                                : MediaQuery.of(context).size.width - 64,
                        body: InteractiveViewer(
                          child: Image.network(
                            example.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimensions.s8),
                        bottomLeft: Radius.circular(AppDimensions.s8),
                      ),
                      child:
                          example.image.isNotEmpty &&
                                  example.image.startsWith('http')
                              ? Image.network(
                                example.image,
                                width: widthImage,
                                fit: BoxFit.cover,
                              )
                              : Image.asset(
                                AppImages.defaultImage,
                                width: widthImage,
                                fit: BoxFit.cover,
                              ),
                    ),
                  ),
                  SizedBox(width: AppDimensions.s16),
                  Expanded(
                    child: Text(
                      example.title,
                      style: TextStyle(
                        fontFamily: 'iCielPony',
                        fontSize: AppDimensions.s16,
                        color: context.color.neutral.shade400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: AppDimensions.s16),
                    child: AudioButton(
                      audioUrl: example.audio,
                      size: AppDimensions.s24,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
