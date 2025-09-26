import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/module/letters_and_numbers/numbers/domain/entites/number.dart';
import 'package:vietlite/widget/button.dart';
import 'package:vietlite/widget/toast.dart';

class CountItems extends StatefulWidget {
  final Number number;

  const CountItems({super.key, required this.number});

  @override
  State<CountItems> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<CountItems> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  int _currentIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  int get count {
    final count = int.tryParse(widget.number.title);
    if (count == null || count <= 0) return 0;
    return count;
  }

  Future<void> _onTap() async {
    if (widget.number.audioUrl.isEmpty) {
      showToast(context, 'audio is empty');
      return;
    }
    _currentIndex = 0;
    await _audioPlayer.stop();

    final path = widget.number.audioUrl;
    final Source source = _toSource(path);
    await _audioPlayer.play(source);

    while (_currentIndex < count) {
      setState(() {
        _currentIndex++;
      });
      await Future.delayed(const Duration(seconds: 1, milliseconds: 300));
    }
    if (_currentIndex >= count) return;
  }

  Source _toSource(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return UrlSource(path);
    }
    if (path.startsWith('file://')) {
      return DeviceFileSource(path.replaceFirst('file://', ''));
    }
    return AssetSource(path);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDimensions.s16),
        Row(
          children: [
            Text(
              context.lang.countingPractice,
              style: context.defaultStyle.bold.s20,
            ),
            const Spacer(),
            SizedBox(
              width: AppDimensions.s130,
              child: Button.primary(
                buttonName: context.lang.start,
                onPressed: _onTap,
              ),
            ),
          ],
        ),
        SizedBox(height: AppDimensions.s16),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(AppDimensions.s16),
          decoration: BoxDecoration(color: context.color.foreground),
          child: Wrap(
            spacing: 12,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              ...widget.number.counts.asMap().entries.map((entry) {
                final index = entry.key; // index in the list
                final icon = entry.value; // the actual icon string

                return SvgPicture.network(
                  (index < _currentIndex) ? icon.colored : icon.noColor,
                  height: AppDimensions.s92,
                  width: AppDimensions.s92,
                  fit: BoxFit.cover,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
