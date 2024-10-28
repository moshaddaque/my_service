import 'package:flutter/material.dart';
import 'package:my_service/helper/data_source.dart';

import '../../widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: serviceList.length,
        itemBuilder: (context, index) {
          var service = serviceList[index];
          return CartItem(
            serviceManName: service["serviceManName"],
            serviceType: service['serviceType'],
            onTap: () {},
            media: media,
            button1Text: "Book Now",
            button2Text: "View All",
          );
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String serviceManName;
  final String serviceType;
  final String button1Text;
  final String button2Text;

  final Size media;

  final Function() onTap;

  const CartItem({
    super.key,
    required this.serviceManName,
    required this.serviceType,
    required this.onTap,
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
                    serviceManName,
                    style: const TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
              Text(
                serviceType,
                style: const TextStyle(
                  fontSize: 18,
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
                    height: 50,
                  ),
                  CustomButton(
                    label: button2Text,
                    onTap: () {},
                    width: media.width * .4,
                    height: 50,
                    textColor: const Color(0xFF284a79),
                    color: Colors.transparent,
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
