import 'package:flutter/cupertino.dart';
import 'package:vietlite/common/extension/build_context.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/widget/audio_button.dart';

import 'hightlight_text.dart';

class SpellSection extends StatelessWidget {
  final List<String> spells;
  final List<String> highlightSpellText;
  final String audioUrl;

  const SpellSection({
    super.key,
    required this.spells,
    required this.highlightSpellText,
    required this.audioUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (spells.length > 1)
          Padding(
            padding: EdgeInsets.only(bottom: AppDimensions.s8),
            child: Row(
              children: [
                ...spells
                    .sublist(0, spells.length - 1)
                    .map(
                      (spell) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right:
                                spell == spells[spells.length - 2]
                                    ? 0
                                    : AppDimensions.s8,
                          ),
                          child: _buildSpellBox(context, spell),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        Row(
          children: [
            Expanded(
              child: _buildSpellBox(context, spells.last, isLarge: true),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpellBox(
    BuildContext context,
    String spellText, {
    bool isLarge = false,
  }) {
    return Container(
      height: AppDimensions.s62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.s8),
        color: context.color.neutral.shade300,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text.rich(
              TextSpan(
                children: highlightText(
                  spellText,
                  highlightSpellText,
                  context.color.secondary,
                  baseStyle: TextStyle(
                    fontFamily: 'iCielPony',
                    fontSize: isLarge ? AppDimensions.s36 : AppDimensions.s24,
                    color: context.color.neutral.shade400,
                  ),
                ),
              ),
            ),
          ),
          if (isLarge)
            Positioned(
              right: AppDimensions.s12,
              child: AudioButton(audioUrl: audioUrl, size: AppDimensions.s32),
            ),
        ],
      ),
    );
  }
}
