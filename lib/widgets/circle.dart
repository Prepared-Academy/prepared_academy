import 'package:flutter/material.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ProgressCircle extends StatelessWidget {
  final int total;
  final int current;
  const ProgressCircle({super.key, required this.total, required this.current});

  @override
  Widget build(BuildContext context) {
    return ((current / total) * total).round() == 0
        ? MiniElevatedButton(onPressed: () {}, text: "Start")
        : SleekCircularSlider(
            innerWidget: (double value) {
              return Center(
                child: Text(
                  "${((current / total) * total).round()}%",
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
            min: 0,
            max: total.toDouble(),
            initialValue: current.toDouble(),
            appearance: CircularSliderAppearance(
              startAngle: 270,
              angleRange: 360,
              customWidths: CustomSliderWidths(
                trackWidth: 2,
                progressBarWidth: 5,
              ),
              size: 50,
              customColors: CustomSliderColors(
                trackColor: Colors.grey.shade200,
                progressBarColor: const Color(0xffF4B400),
              ),
            ),
          );
  }
}
