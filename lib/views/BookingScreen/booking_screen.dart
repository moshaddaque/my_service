import 'package:flutter/material.dart';
import 'package:my_service/helper/data_source.dart';
import 'package:my_service/widgets/custom_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<Widget> tabs = <Widget>[
    const Tab(
      text: "Upcoming",
    ),
    const Tab(
      text: "Previous",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            dividerColor: Colors.blue[200],
            indicatorColor: const Color(0xFF283891),
            labelColor: const Color(0xFF283891),
            padding: const EdgeInsets.symmetric(vertical: 10),
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: serviceList.length,
              primary: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var service = serviceList[index];
                return BookingCard(
                  media: media,
                  serviceManName: service["serviceManName"],
                  serviceType: service['serviceType'],
                  onTap: () {},
                  date: DateTime(DateTime.may),
                  button1Text: "Reschedule",
                  button2Text: "View details",
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: serviceList.length,
              primary: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var service = serviceList[index];
                return BookingCard(
                  media: media,
                  serviceManName: service["serviceManName"],
                  serviceType: service['serviceType'],
                  onTap: () {},
                  date: DateTime(DateTime.april),
                  button1Text: "Share Feedback",
                  button2Text: "View details",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final DateTime date;
  final String serviceManName;
  final String serviceType;
  final String button1Text;
  final String button2Text;

  final Size media;

  final Function() onTap;

  const BookingCard({
    super.key,
    required this.serviceManName,
    required this.serviceType,
    required this.onTap,
    required this.date,
    required this.media,
    required this.button1Text,
    required this.button2Text,
  });

  // final Size media;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: media.width - 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 197, 227, 244),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date.toString().substring(2, 10),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    serviceManName,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                serviceType,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      label: button1Text,
                      onTap: () {},
                      width: media.width * .4,
                      height: 50),
                  CustomButton(
                    label: button2Text,
                    onTap: () {},
                    width: media.width * .4,
                    height: 50,
                    color: Colors.transparent,
                    textColor: const Color(0xFF284a79),
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
