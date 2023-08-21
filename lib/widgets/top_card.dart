import 'package:flutter/material.dart';
import 'package:project_neal/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopCard extends StatefulWidget {
  const TopCard({super.key});

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  late SharedPreferences prefs;
  double totalElapsedTaka = 0; // Sum of elapsed taka values

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotalElapsedTaka();
  }

  Future<void> calculateTotalElapsedTaka() async {
    prefs = await SharedPreferences.getInstance();
    double fanElapsedTaka = prefs.getDouble('fan_elapsed_taka') ?? 0;
    double lightElapsedTaka = prefs.getDouble('light_elapsed_taka') ?? 0;

    setState(() {
      totalElapsedTaka = fanElapsedTaka + lightElapsedTaka;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0, // Adds a soft shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * .95,
          height: 140.0,
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Energy Usage',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.tealAccent.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.power_outlined)),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(color: kFontLightGrey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '28.6 kWh',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            'Today',
                            style: TextStyle(color: kFontLightGrey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${totalElapsedTaka} taka',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Text(
                        '16 Aug, 2023',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.update)),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This Month',
                            style: TextStyle(color: kFontLightGrey),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '345.56 kWh',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
