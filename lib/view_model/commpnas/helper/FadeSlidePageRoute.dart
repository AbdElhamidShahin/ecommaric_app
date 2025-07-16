import 'package:flutter/material.dart';

class SlowHeroRoute extends MaterialPageRoute {
  SlowHeroRoute({required WidgetBuilder builder})
      : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(seconds: 1); // ← بطيئة شوية
}
