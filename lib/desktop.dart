import 'package:analytics_dashboard/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/model.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  late List<AnalyticsData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        header: '',
        decimalPlaces: 3,
        format: '\$point.y',
        canShowMarker: false);
    super.initState();
  }

  

  int selectedScreen = 0;

  void currentScreen(int state) {
    setState(() {
      selectedScreen = state;
    });
  }
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMMM d, y').format(date);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(body: SingleChildScrollView(
      child: Container(
      height: 700,
      width: screenwidth,
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
            decoration: const BoxDecoration(
                border: BorderDirectional(
                    end: BorderSide(color: Color(0xFFD9DCDC)))),
            width: 80,
            child: Column(
              children: [
                SvgPicture.asset('lib/assets/images/vector.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/category.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/trend-up.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/profile-user.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/box.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/discount-shape.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/info-circle.svg'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 46,
                  height: 90,
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Column(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isDark = isDark;
                              darkNotifier.value = !isDark;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: !isDark
                                    ? Colors.greenAccent
                                    : Colors.white),
                            child: SvgPicture.asset(
                                'lib/assets/images/brightness.svg',
                                height: 28),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isDark = !isDark;
                              darkNotifier.value = isDark;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: isDark
                                    ? Colors.greenAccent
                                    : Colors.white),
                            child: SvgPicture.asset(
                                'lib/assets/images/moon.svg',
                                height: 28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                SvgPicture.asset('lib/assets/images/arrow-right.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/setting.svg'),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset('lib/assets/images/logout.svg'),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                        decoration: const BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(color: Color(0xFFD9DCDC)))),
                        height: 100,
                        width: screenwidth - 80,
                        child: Row(
                          children: [
                            const Text(
                              "Dashboard",
                              style: TextStyle(fontFamily: 'Jarkata',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(
                              height: 50,
                              width: 280,
                              child: TextField(
                                decoration: InputDecoration(
                                  enabled: true,
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.search),
                                  label: Text('Search...'),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFD9DCDC)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(fontFamily: 'Jarkata',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      color: const Color(0xFFD9DCDC))),
                              child: const Icon(
                                Icons.notifications_none_outlined,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                                height: 54,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xFFD9DCDC),
                                        style: BorderStyle.solid)),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                          child: Image.asset(
                                        'lib/assets/images/appbaricon.png',
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      )),
                                      const SizedBox(width: 8),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Justin Berson',
                                            style: TextStyle(fontFamily: 'Jarkata',
                                              color: Color.fromARGB(
                                                  255, 75, 78, 85),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Text('justin@gmail.com',
                                              style: TextStyle(fontFamily: 'Jarkata',
                                                color: Color.fromARGB(
                                                    255, 149, 146, 158),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 0,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                              'lib/assets/images/arrowdown.svg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                    width: 16,
                  ),
                  // ///////////////////
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(children: [
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 2.0,
                          shadowColor: Colors.transparent,
                          color: Theme.of(context).cardColor,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            width: 760,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Sales Trend",
                                      style: TextStyle(fontFamily: 'Jarkata',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Short by:  ",
                                      style: TextStyle(fontFamily: 'Jarkata',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    DropdownMenu(
                                      inputDecorationTheme: InputDecorationTheme(
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  8, 2, 8, 2),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30))),
                                      label: const Text(
                                        'weekly',
                                        style: TextStyle(fontFamily: 'Jarkata',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      dropdownMenuEntries: const [
                                        DropdownMenuEntry(
                                          value: 'weekly',
                                          label: 'weekly',
                                        ),
                                        DropdownMenuEntry(
                                          value: 'Daily',
                                          label: 'Daily',
                                        ),
                                        DropdownMenuEntry(
                                            value: 'Monthly', label: 'Monthly'),
                                      ],
                                      trailingIcon: SvgPicture.asset(
                                          'lib/assets/images/arrowdown.svg'),
                                    )
                                  ],
                                ),
                                SfCartesianChart(
                                  tooltipBehavior: _tooltipBehavior,
                                  series: <ColumnSeries<AnalyticsData, String>>[
                                    ColumnSeries<AnalyticsData, String>(
                                      width: 0.6,
                                      selectionBehavior: SelectionBehavior(
                                        enable: true,
                                      ),
                                      dataSource: _chartData,
                                      xValueMapper: (AnalyticsData trends, _) =>
                                          trends.months,
                                      yValueMapper: (AnalyticsData trends, _) =>
                                          trends.trends,
                                      enableTooltip: true,
                                      gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF34CAA5),
                                            Color.fromARGB(255, 167, 235, 202),
                                            Color.fromARGB(255, 220, 244, 232)
                                          ]),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                    )
                                  ],
                                  primaryXAxis: const CategoryAxis(
                                    majorGridLines: MajorGridLines(width: 0),
                                  ),
                                  primaryYAxis: NumericAxis(
                                    numberFormat:
                                        NumberFormat.decimalPatternDigits(locale: "en_US",decimalDigits: 3),
                                    edgeLabelPlacement: EdgeLabelPlacement.shift,
                                    majorGridLines:
                                        const MajorGridLines(dashArray: [4]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  elevation: 2,
                                  color: Theme.of(context).cardColor,
                                  shadowColor: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    width: 220,
                                    height: 185,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'lib/assets/images/box-tick.svg'),
                                            const Spacer(),
                                            SvgPicture.asset(
                                                'lib/assets/images/high.svg')
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Total Order',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          '350',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 2, 6, 2),
                                                  decoration: const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 225, 251, 239),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'lib/assets/images/liltrendingup.svg'),
                                                      const Text('23.5%',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(fontFamily: 'Jarkata',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.green)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Text(' vs. previous month',
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Card(
                                  elevation: 2,
                                  color: Theme.of(context).cardColor,
                                  shadowColor: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    width: 220,
                                    height: 185,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'lib/assets/images/rotate.svg'),
                                            const Spacer(),
                                            SvgPicture.asset(
                                                'lib/assets/images/low.svg')
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Total Refund',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          '270',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 2, 6, 2),
                                                  decoration: const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 255, 218, 218),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'lib/assets/images/liltrendingdown.svg'),
                                                      const Text('23.5%',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(fontFamily: 'Jarkata',
                                                              fontSize: 12,
                                                              color: Colors.red)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Text(' vs. previous month',
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Card(
                                  elevation: 2,
                                  color: Theme.of(context).cardColor,
                                  shadowColor: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    width: 220,
                                    height: 185,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'lib/assets/images/shopping-cart.svg'),
                                            const Spacer(),
                                            SvgPicture.asset(
                                                'lib/assets/images/low.svg')
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Average Sales',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          '1567',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 2, 6, 2),
                                                  decoration: const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 255, 218, 218),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'lib/assets/images/liltrendingdown.svg'),
                                                      const Text('23.5%',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(fontFamily: 'Jarkata',
                                                              fontSize: 12,
                                                              color: Colors.red)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Text(' vs. previous month',
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Card(
                                  elevation: 2,
                                  color: Theme.of(context).cardColor,
                                  shadowColor: Colors.transparent,
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    width: 220,
                                    height: 185,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'lib/assets/images/coin.svg'),
                                            const Spacer(),
                                            SvgPicture.asset(
                                                'lib/assets/images/high.svg')
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'Total Income',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          '\$350.000',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(fontFamily: 'Jarkata',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          6, 2, 6, 2),
                                                  decoration: const BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 225, 251, 239),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'lib/assets/images/liltrendingup.svg'),
                                                      const Text('23.5%',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(fontFamily: 'Jarkata',
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.green)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Text(' vs. previous month',
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Card(
                              elevation: 2.0,
                              color: Theme.of(context).cardColor,
                              shadowColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                width: 760,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Column(
                                  children: [
                                     Row(
                                      children: [
                                       const Text(
                                          'Last Orders',
                                          style: TextStyle(fontFamily: 'Jarkata',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                        const Spacer(),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: const Text('See All',
                                                style: TextStyle(fontFamily: 'Jarkata',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24,
                                                    color: Colors.greenAccent)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Table(
                                          columnWidths: const {
                                            0: FlexColumnWidth(2),
                                          },
                                          children: [
                                            const TableRow(children: [
                                              Text('Name',
                                                  style: TextStyle(fontFamily: 'Jarkata',
                                                      color: Color(0xA3A3A3A3))),
                                              Text('Date',
                                                  style: TextStyle(fontFamily: 'Jarkata',
                                                      color: Color(0xA3A3A3A3))),
                                              Text('Amount',
                                                  style: TextStyle(fontFamily: 'Jarkata',
                                                      color: Color(0xA3A3A3A3))),
                                              Text('Status',
                                                  style: TextStyle(fontFamily: 'Jarkata',
                                                      color: Color(0xA3A3A3A3))),
                                              Text('Invoice',
                                                  style: TextStyle(fontFamily: 'Jarkata',
                                                      color: Color(0xA3A3A3A3))),
                                            ]),
                                            for (int i = 0; i < users.length; i++)
                                              TableRow(
                                                  decoration: const BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color: Color(
                                                                  0xF5F5F5F5)))),
                                                  children: [
                                                    TableCell(
                                                        verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  8, 14, 8, 14),
                                                          child: Row(
                                                            children: [
                                                              ClipOval(
                                                                child:
                                                                    Image.asset(
                                                                  users[i]
                                                                      ['image'],
                                                                  width: 34,
                                                                  height: 34,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                  users[i]
                                                                      ['name'],
                                                                  style:
                                                                      const TextStyle(fontFamily: 'Jarkata',
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                            ],
                                                          ),
                                                        )),
                                                    TableCell(
                                                        verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Text(
                                                            users[i]['date'],
                                                            style: const TextStyle(fontFamily: 'Jarkata',
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xFF737373)))),
                                                    TableCell(
                                                      verticalAlignment:
                                                          TableCellVerticalAlignment
                                                              .middle,
                                                      child: Text(
                                                          users[i]['amount'],
                                                          style: const TextStyle(fontFamily: 'Jarkata',
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    if (users[i]['status'] ==
                                                        true)
                                                      const TableCell(
                                                        verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Text('Paid',
                                                            style: TextStyle(fontFamily: 'Jarkata',
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .greenAccent)),
                                                      )
                                                    else
                                                      const TableCell(
                                                        verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Text('Refund',
                                                            style: TextStyle(fontFamily: 'Jarkata',
                                                                fontSize: 16,
                                                                color:
                                                                    Colors.red)),
                                                      ),
                                                    TableCell(
                                                        verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                users[i]
                                                                    ['invoice']),
                                                            const SizedBox(
                                                                width: 8),
                                                            const Text(
                                                              'Vew',
                                                              style: TextStyle(fontFamily: 'Jarkata',
                                                                fontSize: 14,
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                  ])
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Card(
                              elevation: 2,
                              color: Theme.of(context).cardColor,
                              shadowColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                width: 470,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Top Platform",
                                          style: TextStyle(fontFamily: 'Jarkata',
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: const Text('See All',
                                                style: TextStyle(fontFamily: 'Jarkata',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 24,
                                                    color: Colors.greenAccent)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text("Book Bazaar",
                                        style: TextStyle(fontFamily: 'Jarkata',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    LinearProgressIndicator(
                                      color: Colors.deepPurple,
                                      value: 0.5,
                                      minHeight: 11,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("\$2,500,000",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                        Spacer(),
                                        Text("+15%",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text("Artisan Aisle",
                                        style: TextStyle(fontFamily: 'Jarkata',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    LinearProgressIndicator(
                                      color: Colors.blue,
                                      value: 0.45,
                                      minHeight: 11,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("\$1,800,000",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                        Spacer(),
                                        Text("+10%",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text("Toy Troop",
                                        style: TextStyle(fontFamily: 'Jarkata',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    LinearProgressIndicator(
                                      color: Colors.orangeAccent,
                                      value: 0.22,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      minHeight: 11,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("\$1,200,000",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                        Spacer(),
                                        Text("+8%",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text("XStore",
                                        style: TextStyle(fontFamily: 'Jarkata',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    LinearProgressIndicator(
                                      color: Colors.deepOrange,
                                      value: 0.22,
                                      minHeight: 11,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text("\$600,000",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                        Spacer(),
                                        Text("+5%",
                                            style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                    ],),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
            ),
    ),);
  }
  List<AnalyticsData> getChartData() {
    final List<AnalyticsData> chartData = [
      AnalyticsData('Jan', 10.000),
      AnalyticsData('Feb', 20.000),
      AnalyticsData('Mar', 5.000),
      AnalyticsData('Apr', 35.000),
      AnalyticsData('Mei', 15.000),
      AnalyticsData('Jun', 45.000),
      AnalyticsData('Jul', 15.000),
      AnalyticsData('Aug', 25.000),
      AnalyticsData('Sep', 32.000),
      AnalyticsData('Okt', 7.000),
      AnalyticsData('Nov', 30.000),
      AnalyticsData('Dec', 25.000),
    ];
    return chartData;
  }
}
var barcolor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.greenAccent,
      Color.fromARGB(255, 167, 235, 202),
      Color.fromARGB(255, 220, 244, 232)
    ]);