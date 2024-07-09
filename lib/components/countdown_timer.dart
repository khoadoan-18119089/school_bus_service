import 'dart:async';
import 'package:flutter/material.dart';
import 'package:school_bus_service/commom/format.dart';
import 'package:school_bus_service/components/cus_button.dart';
import 'package:school_bus_service/components/cus_text.dart';


class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    this.text,
    this.textButton,
  });

  final String? text;

  final String? textButton;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Duration _duration = const Duration(seconds: 60);

  bool _isRunning = false;

  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int seconds = _duration.inSeconds - 1;
        if (seconds > 0) {
          _duration = Duration(seconds: seconds);
        } else {
          _duration = const Duration(seconds: 60);
          _isRunning = false;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return textAndCountdown();
  }

  Widget textAndCountdown() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.text != null) ...[CusText.bodyMedium(widget.text!)],
        const SizedBox(width: 8),
        if (widget.textButton != null) ...[
          CusButton.text(
            disable: _isRunning,
            text: widget.textButton!,
            onPressed: _startTimer,
          )
        ],
        const SizedBox(width: 8),
        if (_isRunning) ...[CusText.bodyMedium('(${_duration.toMMSS()})')],
      ],
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
