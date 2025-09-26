import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vietlite/app/res/icons.dart';
import 'package:vietlite/widget/toast.dart';

class AudioButton extends StatefulWidget {
  final String audioUrl;
  final double size;

  const AudioButton({super.key, required this.audioUrl, required this.size});

  @override
  State<AudioButton> createState() => _AudioButtonState();
}

class _AudioButtonState extends State<AudioButton> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onTap() async {
    if (widget.audioUrl.isEmpty) {
      showToast(context, 'audio url is empty');
      return;
    }
    await _audioPlayer.play(UrlSource(widget.audioUrl));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: SvgPicture.asset(
        AppIcons.audioPlaying,
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
