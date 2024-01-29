import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<AnalyticsData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final List _screenList = [
    const Home(),
  ];

  int selectedScreen = 0;

  void currentScreen(int state) {
    setState(() {
      selectedScreen = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String formattedDate = DateFormat('MMMM d, y').format(date);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        flexibleSpace: Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 16, 16),
          child: Row(
            children: [
              const Text("Dashboard"),
              const Spacer(),
              const SizedBox(
                height: 68,
                width: 280,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text('Search...'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const Icon(Icons.calendar_month_outlined),
              const SizedBox(
                width: 20,
              ),
              Text(formattedDate),
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.notifications_none_outlined,
              ),
              SizedBox(
                  height: 68,
                  width: 280,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          side: BorderSide(style: BorderStyle.solid, width: 2)),
                      leading: ClipOval(
                        child: Image.asset(
                          'lib/assets/images/appbaricon.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text('Justin Berson'),
                      subtitle: const Text('justin@gmail.com'),
                      trailing:
                          SvgPicture.asset('lib/assets/images/arrowdown.svg'),
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            leading: SvgPicture.asset('lib/assets/images/vector.svg'),
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                  icon: SvgPicture.asset('lib/assets/images/category.svg'),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon: SvgPicture.asset('lib/assets/images/trend-up.svg'),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon: SvgPicture.asset('lib/assets/images/profile-user.svg'),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon: SvgPicture.asset('lib/assets/images/box.svg'),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon:
                      SvgPicture.asset('lib/assets/images/discount-shape.svg'),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon: SvgPicture.asset('lib/assets/images/info-circle.svg'),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon: SvgPicture.asset(
                    'lib/assets/images/brightness.svg',
                    color: Colors.green[300],
                  ),
                  label: const Text('Icon')),
              NavigationRailDestination(
                  icon: SvgPicture.asset('lib/assets/images/moon.svg'),
                  label: const Text('Icon')),
            ],
            selectedIndex: selectedScreen,
            useIndicator: false,
            trailing: Column(children: [
              SvgPicture.asset('lib/assets/images/arrow-right.svg'),
              SvgPicture.asset('lib/assets/images/setting.svg'),
              SvgPicture.asset('lib/assets/images/logout.svg')
            ]),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 400,
                          width: 620,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Sales Trend"),
                                  const Spacer(),
                                  const Text("Short by:"),
                                  DropdownMenu(
                                    inputDecorationTheme: InputDecorationTheme(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(36))),
                                    menuHeight: 50,
                                    label: const Text('weekly'),
                                    dropdownMenuEntries: const [
                                      DropdownMenuEntry(
                                          value: 'weekly', label: 'weekly')
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
                                      Colors.greenAccent,
                                      Color.fromARGB(255, 167, 235, 202),
                                      Color.fromARGB(255, 220, 244, 232)
                                    ]),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  )
                                ],
                                primaryXAxis: const CategoryAxis(majorGridLines: MajorGridLines(width: 0),),
                                primaryYAxis: const NumericAxis(
                                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                                  majorGridLines: MajorGridLines(dashArray:[4]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 450,
                          width: 800,
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text('Last Orders'),
                                  Spacer(),
                                  Text('See All')
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(20.0),
                                    child: Table(
                                      border:
                                          TableBorder.all(color: Colors.black),
                                      children: [
                                        const TableRow(children: [
                                          Text('Name'),
                                          Text('Date'),
                                          Text('Amount'),
                                          Text('Status'),
                                          Text('Invoice'),
                                        ]),
                                        for (int i = 0; i < users.length; i++)
                                          TableRow(children: [
                                            TableCell(
                                                child: Row(
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    users[i]['image'],
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(users[i]['name']),
                                              ],
                                            )),
                                            Text(users[i]['date']),
                                            Text(users[i]['amount']),
                                            if (users[i]['status'] == true)
                                              const Text('Paid')
                                            else
                                              const Text('Refund'),
                                            TableCell(
                                                child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    users[i]['invoice']),
                                                const Text('Vew')
                                              ],
                                            ))
                                          ])
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'lib/assets/images/box-tick.svg'),
                                  const Spacer(),
                                  SvgPicture.asset('lib/assets/images/high.svg')
                                ],
                              ),
                              const Text('Total Order'),
                              const Text('350'),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'lib/assets/images/liltrendingup.svg'),
                                          const Text('23.5%'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Text('vs previous month')
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'lib/assets/images/rotate.svg'),
                                  const Spacer(),
                                  SvgPicture.asset('lib/assets/images/low.svg')
                                ],
                              ),
                              const Text('Total Refund'),
                              const Text('270'),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'lib/assets/images/liltrendingdown.svg'),
                                          const Text('23.5%'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Text('vs previous month')
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'lib/assets/images/shopping-cart.svg'),
                                  const Spacer(),
                                  SvgPicture.asset('lib/assets/images/low.svg')
                                ],
                              ),
                              const Text('Average Sales'),
                              const Text('1567'),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'lib/assets/images/liltrendingdown.svg'),
                                          const Text('23.5%'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Text('vs previous month')
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'lib/assets/images/coin.svg'),
                                  const Spacer(),
                                  SvgPicture.asset('lib/assets/images/high.svg')
                                ],
                              ),
                              const Text('Total Income'),
                              const Text("\$350.000"),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'lib/assets/images/liltrendingup.svg'),
                                          const Text('23.5%'),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Text('vs previous month')
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          height: 350,
                          width: 350,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Top Platform"),
                                  Spacer(),
                                  Text("See All")
                                ],
                              ),
                              Text("Book Bazaar"),
                              LinearProgressIndicator(
                                color: Colors.deepPurple,
                                value: 0.5,
                              ),
                              Row(
                                children: [
                                  Text("\$2,500,000"),
                                  Spacer(),
                                  Text("+15%")
                                ],
                              ),
                              Text("Artisan Aisle"),
                              LinearProgressIndicator(
                                color: Colors.blue,
                                value: 0.45,
                              ),
                              Row(
                                children: [
                                  Text("\$1,800,000"),
                                  Spacer(),
                                  Text("+10%")
                                ],
                              ),
                              Text("Toy Troop"),
                              LinearProgressIndicator(
                                color: Colors.orangeAccent,
                                value: 0.22,
                              ),
                              Row(
                                children: [
                                  Text("\$1,200,000"),
                                  Spacer(),
                                  Text("+8%")
                                ],
                              ),
                              Text("XStore"),
                              LinearProgressIndicator(
                                color: Colors.deepOrange,
                                value: 0.22,
                              ),
                              Row(
                                children: [
                                  Text("\$600,000"),
                                  Spacer(),
                                  Text("+5%")
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
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