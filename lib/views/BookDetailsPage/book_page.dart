import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_service/views/HomePage/home_page.dart';

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
    DateTime? dateTime;
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
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            height: 240,
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
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10),
                      right: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          const Text(
                            "Select Date",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DateTimePicker(),
                          ),
                        ],
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

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDate;

  String formatDate(DateTime date) {
    return DateFormat("dd MMMM yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomPicker.date(
          pickerTitle: const Text("Pick a date"),
          dateOrder: DatePickerDateOrder.dmy,
          titlePadding: const EdgeInsets.all(10),
          bottomPickerTheme: BottomPickerTheme.plumPlate,
          pickerTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blue,
          ),
          onSubmit: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          titleAlignment: Alignment.topCenter,
        ).show(context);
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedDate != null
                ? const Color(0xFFFB631A)
                : const Color(0xFF284a79),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            selectedDate != null
                ? Text(
                    "${formatDate(selectedDate!)}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: const Color(0xFFFB631A),
                    ),
                  )
                : Text(
                    "01-May-2024",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
            selectedDate != null
                ? const SizedBox()
                : const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
          ],
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
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddressForm(),
            );
          },
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
            "Proceed",
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

class AddressForm extends StatelessWidget {
  const AddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Wrap(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAT8OCY-xgr3QvK4_z_JMDdD16xQA3NYYx7Q&s",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("House/Flat Number *"),
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Landmark (Optional)"),
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Save as Home/Other buttons
                  Text('Save as', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ChoiceChip(
                        label: const Text('Home'),
                        selected: true,
                        onSelected: (bool selected) {},
                        labelStyle: const TextStyle(color: Colors.white),
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey[200],
                      ),
                      const SizedBox(width: 16),
                      ChoiceChip(
                        label: const Text('Other'),
                        selected: false,
                        onSelected: (bool selected) {},
                        labelStyle: const TextStyle(color: Colors.black),
                        backgroundColor: Colors.grey[200],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text(
                        'Save and Proceed to slots',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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
