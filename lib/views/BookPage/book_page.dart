import 'package:flutter/material.dart';

enum BookingTime {
  morning,
  evening,
  night,
}

class BookPage extends StatelessWidget {
  final Map service;
  const BookPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF284a79),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF284a79),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: media.width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 197, 227, 244),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          service["serviceType"],
                                          style: const TextStyle(
                                            color: Color(0xFF284a79),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "By ${service["serviceManName"]}",
                                          style: const TextStyle(
                                            color: Color(0xFF284a79),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: ColoredBox(
                                          color: const Color(0xFFFB631A),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            child: Text(
                                              "\$${service["charge"].toStringAsFixed(1)}/Hour",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        service["serviceManImage"],
                                        width: media.width * .25,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        service["serviceImage1"],
                                        width: media.width * .25,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        service["serviceImage2"],
                                        width: media.width * .25,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "About",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(service["about"] ?? "About"),
                          const SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //============================
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const TimeSelection(),
                      const SizedBox(
                        height: 10,
                      ),
                      BookButton(media: media),
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
}

class BookButton extends StatelessWidget {
  const BookButton({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "Booked Successfully",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.greenAccent,
            behavior: SnackBarBehavior.floating,
            dismissDirection: DismissDirection.none,
            elevation: 5,
            margin: EdgeInsets.only(
              bottom: media.height - 100,
              left: 10,
              right: 10,
            ),
          ),
        );
      },
      child: Container(
        width: media.width,
        height: 60,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF284a79),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Book Now",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSelection extends StatefulWidget {
  const TimeSelection({super.key});

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  // Declare selectedTime as a state variable
  BookingTime selectedTime = BookingTime.morning;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Time",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimeSelectCard(
                media: media,
                label: BookingTime.morning.name,
                onTap: () {
                  setState(() {
                    selectedTime = BookingTime.morning;
                  });
                },
                isSelected: selectedTime == BookingTime.morning,
              ),
              SizedBox(
                width: media.width * .05,
              ),
              TimeSelectCard(
                media: media,
                label: BookingTime.evening.name,
                onTap: () {
                  setState(() {
                    selectedTime = BookingTime.evening;
                  });
                },
                isSelected: selectedTime == BookingTime.evening,
              ),
              SizedBox(
                width: media.width * .05,
              ),
              TimeSelectCard(
                media: media,
                label: BookingTime.night.name,
                onTap: () {
                  setState(() {
                    selectedTime = BookingTime.night;
                  });
                },
                isSelected: selectedTime == BookingTime.night,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeSelectCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const TimeSelectCard({
    super.key,
    required this.media,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: media.width * .25,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFB631A) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: isSelected ? const Color(0xFFFB631A) : Colors.black54),
          ),
          child: Column(
            children: [
              Text(
                label[0].toUpperCase() + label.substring(1),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
