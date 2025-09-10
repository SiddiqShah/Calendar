import 'package:flutter/material.dart';

const List<int> profilePicDates = [9, 10, 12, 13, 14, 22, 23];
const List<int> threeArcDates = [1, 7, 17];
const List<int> fiveArcDates = [3, 4, 6, 15, 16, 19, 21, 23, 25, 26, 27, 28, 29];
const List<Color> arcColors = [
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.brown,
  Colors.pink,
];

class CustomDay extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final bool isToday;

  const CustomDay({
    super.key,
    required this.date,
    required this.isSelected,
    required this.isToday,
  });

  @override
  Widget build(BuildContext context) {
    final int day = date.day;
    final bool hasPic = profilePicDates.contains(day);

    int arcsCount = 0;
    if (threeArcDates.contains(day)) {
      arcsCount = 3;
    } else if (fiveArcDates.contains(day)) {
      arcsCount = 5;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: hasPic ? Colors.transparent : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        ),
        if (!hasPic && day != 30 && arcsCount > 0)
          CustomPaint(
            size: const Size(44, 44),
            painter: ArcRingPainter(arcsCount),
          ),
        if ((arcsCount > 0 && day != 30) && (day != 23 || !hasPic))
          CustomPaint(
            size: const Size(44, 44),
            painter: ArcRingPainter(arcsCount),
          ),
        if (day == 23 && hasPic)
          CustomPaint(
            size: const Size(44, 44),
            painter: ArcRingPainter(arcsCount),
          ),
        if (hasPic)
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset("images/f.jpg", fit: BoxFit.cover),
                  Container(
                    color: Colors.black.withOpacity(0.45),
                  ),
                ],
              ),
            ),
          ),
        if (isSelected && day == DateTime.now().day)
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF8E83F8),
              shape: BoxShape.circle,
            ),
          ),
        if (day == 30)
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF8E83F8), width: 3.2),
            ),
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(29, 29), 
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFF8E83F8),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        Center(
          child: Text(
            "$day",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: hasPic || (isSelected && day == DateTime.now().day) ? Colors.white : Colors.black87,
              shadows: hasPic
                  ? const [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.black38,
                        offset: Offset(1, 1),
                      ),
                    ]
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}

class ArcRingPainter extends CustomPainter {
  final int arcsCount;
  ArcRingPainter(this.arcsCount);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final colors = arcColors.sublist(0, arcsCount);

    final double startAngle = 3.0 * 3.141592653589793 / 9.0;

    double arcSweep, gap;
    if (arcsCount == 5) {
      arcSweep = (2 * 3.141592653589793 / 5.0) * 0.83;
      gap = (2 * 3.141592653589793 / 5.0) * 0.17;
    } else if (arcsCount == 3) {
      arcSweep = 0.85;
      gap = 0.55;
    } else {
      arcSweep = 0.0;
      gap = 0.0;
    }

    double angle = startAngle;
    for (final color in colors) {
      final paint = Paint()
        ..color = color
        ..strokeWidth = 3.2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - 1.6), 
        angle,
        arcSweep,
        false,
        paint,
      );
      angle += arcSweep + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}