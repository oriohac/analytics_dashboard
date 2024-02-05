import 'package:analytics_dashboard/desktop.dart';
import 'package:analytics_dashboard/mobile.dart';
import 'package:analytics_dashboard/tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'main.dart';
import 'models/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Mobile();
      } else if (constraints.maxWidth < 1200) {
        return Tablet();
      } else {
        return Desktop();
      }
    });
  }
}


