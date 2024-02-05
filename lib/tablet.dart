import 'package:flutter/material.dart';
import 'package:analytics_dashboard/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'models/model.dart';

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
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
    // String formattedDate = DateFormat('MMMM d, y').format(date);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title: const Text("Dashboard",
            style: TextStyle(fontFamily: 'Jarkata',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                height: 56,
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 1.0,
                        color: const Color(0xFFD9DCDC),
                        style: BorderStyle.solid)),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                          child: Image.asset(
                        'lib/assets/images/appbaricon.png',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      )),
                      const SizedBox(width: 8),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Justin Berson',
                            style: TextStyle(fontFamily: 'Jarkata',
                              color: Color.fromARGB(255, 75, 78, 85),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text('justin@gmail.com',
                              style: TextStyle(fontFamily: 'Jarkata',
                                color: Color.fromARGB(255, 149, 146, 158),
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
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        width: 280,
        child: ListView(
          children: [
            // DrawerHeader(
            //   margin: EdgeInsets.all(0),
            //   padding: EdgeInsets.fromLTRB(12, 48, 12, 16),
            //   child: ,
            // ),
            ListTile(
              minVerticalPadding: 50,
              leading: SvgPicture.asset("lib/assets/images/vector.svg"),
              title: const Text("Dashboard",
                  style: TextStyle(fontFamily: 'Jarkata',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            const Divider(),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/category.svg'),
              title: const Text("CATEGORY"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/trend-up.svg'),
              title: const Text("TREND"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/profile-user.svg'),
              title: const Text("PROFILE"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/box.svg'),
              title: const Text("MAIL"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/discount-shape.svg'),
              title: const Text("DISCOUNT"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/info-circle.svg'),
              title: const Text("INFO"),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(width: 14),
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
                              : Colors.transparent),
                      child: SvgPicture.asset(
                          'lib/assets/images/brightness.svg',
                          height: 28),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
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
                          color:
                              isDark ? Colors.greenAccent : Colors.transparent),
                      child: SvgPicture.asset('lib/assets/images/moon.svg',
                          height: 28),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/arrow-right.svg'),
              title: const Text("PROCEED"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/setting.svg'),
              title: const Text("SETTINGS"),
            ),
            ListTile(
              leading: SvgPicture.asset('lib/assets/images/logout.svg'),
              title: const Text("LOGOUT"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          height: screenheight,
          width: screenwidth,
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            elevation: 2.0,
                            shadowColor: Colors.white,
                            color: Theme.of(context).cardColor,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
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
                                        "Sort by:  ",
                                        style: TextStyle(fontFamily: 'Jarkata',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      DropdownMenu(
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                                contentPadding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 2, 8, 2),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30))),
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
                                              value: 'Monthly',
                                              label: 'Monthly'),
                                        ],
                                        trailingIcon: SvgPicture.asset(
                                            'lib/assets/images/arrowdown.svg'),
                                      )
                                    ],
                                  ),
                                  SfCartesianChart(
                                    tooltipBehavior: _tooltipBehavior,
                                    series: <ColumnSeries<AnalyticsData,
                                        String>>[
                                      ColumnSeries<AnalyticsData, String>(
                                        width: 0.6,
                                        selectionBehavior: SelectionBehavior(
                                          enable: true,
                                        ),
                                        dataSource: _chartData,
                                        xValueMapper:
                                            (AnalyticsData trends, _) =>
                                                trends.months,
                                        yValueMapper:
                                            (AnalyticsData trends, _) =>
                                                trends.trends,
                                        enableTooltip: true,
                                        gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF34CAA5),
                                              Color.fromARGB(
                                                  255, 167, 235, 202),
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
                                          NumberFormat.decimalPatternDigits(
                                              locale: "en_US",
                                              decimalDigits: 3),
                                      edgeLabelPlacement:
                                          EdgeLabelPlacement.shift,
                                      majorGridLines:
                                          const MajorGridLines(dashArray: [4]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              Card(
                                elevation: 2,
                                color: Theme.of(context).cardColor,
                                shadowColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: double.maxFinite,
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
                                          const Expanded(
                                            child: Text('vs. previous month',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(fontFamily: 'Jarkata',
                                                  fontSize: 14,
                                                )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Card(
                                elevation: 2,
                                color: Theme.of(context).cardColor,
                                shadowColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: double.maxFinite,
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
                                          const Expanded(
                                            child: Text(' vs. previous month',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Card(
                                elevation: 2,
                                color: Theme.of(context).cardColor,
                                shadowColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: double.maxFinite,
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
                                          const Expanded(
                                            child: Text(' vs. previous month',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Card(
                                elevation: 2,
                                color: Theme.of(context).cardColor,
                                shadowColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: double.maxFinite,
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
                                          const Expanded(
                                            child: Text(' vs. previous month',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(fontFamily: 'Jarkata',fontSize: 14)),
                                          )
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
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          Card(
                            elevation: 2.0,
                            color: Theme.of(context).cardColor,
                            shadowColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              width: double.maxFinite,
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
                                                  Expanded(
                                                    child: TableCell(
                                                        verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 14, 0, 14),
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
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
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
                          ),
                          const SizedBox(height: 16),
                          Card(
                            margin: const EdgeInsets.only(bottom: 100),
                            elevation: 2,
                            color: Theme.of(context).cardColor,
                            shadowColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Top Platform",
                                        style: TextStyle(fontFamily: 'Jarkata',
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
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
                                  const SizedBox(height: 10),
                                  const Text("Book Bazaar",
                                      style: TextStyle(fontFamily: 'Jarkata',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  const LinearProgressIndicator(
                                    color: Colors.deepPurple,
                                    value: 0.5,
                                    minHeight: 11,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Text("\$2,500,000",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                      Spacer(),
                                      Text("+15%",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text("Artisan Aisle",
                                      style: TextStyle(fontFamily: 'Jarkata',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  const LinearProgressIndicator(
                                    color: Colors.blue,
                                    value: 0.45,
                                    minHeight: 11,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Text("\$1,800,000",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                      Spacer(),
                                      Text("+10%",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text("Toy Troop",
                                      style: TextStyle(fontFamily: 'Jarkata',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  const LinearProgressIndicator(
                                    color: Colors.orangeAccent,
                                    value: 0.22,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    minHeight: 11,
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Text("\$1,200,000",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                      Spacer(),
                                      Text("+8%",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text("XStore",
                                      style: TextStyle(fontFamily: 'Jarkata',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  const LinearProgressIndicator(
                                    color: Colors.deepOrange,
                                    value: 0.22,
                                    minHeight: 11,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Text("\$600,000",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18)),
                                      Spacer(),
                                      Text("+5%",
                                          style: TextStyle(fontFamily: 'Jarkata',fontSize: 18))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
