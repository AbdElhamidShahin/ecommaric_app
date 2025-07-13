import 'package:flutter/material.dart';

const Gradient appBackgroundGradient = LinearGradient(
  begin: Alignment.topLeft, // يبدأ من أعلى اليسار
  end: Alignment.bottomRight, // ينتهي إلى أسفل اليمين
  colors: [
    Color(0xFF34363D), // اللون الفاتح
    Color(0xFF1A1B1D), // اللون الغامق
  ],
  stops: [0.0, 0.3], // بداية ونهاية التدرج
);
const Gradient CustomdetailsUpper = LinearGradient(
  begin: Alignment.topRight, // يبدأ من أعلى اليسار
  end: Alignment.bottomLeft, // ينتهي إلى أسفل اليمين
  colors: [
    Color(0xFF34363D), // اللون الفاتح
    Color(0xFF1A1B1D), // اللون الغامق
  ],
  stops: [0.0, 0.2], // بداية ونهاية التدرج
);
const Gradient ColorItem = RadialGradient(
  center: Alignment.topRight,
  radius: 1.2,
  colors: [
    Color(0xFF4C505B),
    Color(0xFF212226),
  ],
  stops: [0.0, 0.8],
);


const Gradient ColorItemFavorite = LinearGradient(
  begin: Alignment.topLeft, // يبدأ من أعلى اليسار
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF3F434D),
    Color(0xFF212226),
  ],
  stops: [0.0, 0.8],
);





const Gradient ColorBest = RadialGradient(
  center: Alignment.centerLeft,
  radius: 1.2,
  colors: [
    Color(0xFF3F434D),
    Color(0xFF212226),
  ],
  stops: [0.0, 0.7],
);
const Gradient ColorBestCountinar = RadialGradient(
  center: Alignment.centerLeft,
  radius: 1.2,
  colors: [
    Color(0xFF4C505B),
    Color(0xFF212226),
  ],
  stops: [.0, .7],
);
const Gradient ColorTextBottom = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,// يبدأ من أعلى اليسار
  colors: [
    Color(0xFF34363D),
    Color(0xFF212226),
  ],
  stops: [.0, .9],
);const Gradient ColorItemsFavorite = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,// يبدأ من أعلى اليسار
  colors: [
    Color(0xFF2F3137),
    Color(0xFF212226),
  ],
  stops: [.0, .7],
);
const Color colorBasic = Color(0xFFFFCB8D);
const Color colorA = Color(0xFFA74138);
const Color colorB = Color(0xFFF7941D);
const Color bottomBar = Color(0xFF282A2F);
