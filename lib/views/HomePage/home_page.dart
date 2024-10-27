import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: media.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 232, 235),
                        Color.fromARGB(255, 197, 227, 244),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hello, Esu Moni",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                              "https://sharedp.com/wp-content/uploads/2024/06/cute-girl-pic-cartoon-960x1024.jpg",
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Which Service Do You Need?",
                        style: TextStyle(
                          color: Color(0xFF284a79),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: media.width,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "How can I Help you?",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF284a79),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoryCard(
                            title: "Cleaning",
                            image: "assets/images/cleaning.png",
                          ),
                          CategoryCard(
                            title: "Painting",
                            image: "assets/images/painting.png",
                          ),
                          CategoryCard(
                            title: "Laundry",
                            image: "assets/images/laundry.png",
                          ),
                          CategoryCard(
                            title: "Reparing",
                            image: "assets/images/reparing.png",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Popular Service",
                    style: TextStyle(
                      color: Color(0xFF284a79),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ServiceCard(
                  media: media,
                  charge: 24,
                  serviceManName: "Shauli",
                  serviceType: "Home Cleaning",
                  serviceManImage:
                      "https://www.missionphotographe.com/ressources/images-actualites/actualite-204.jpg",
                  rating: 3.5,
                ),
                ServiceCard(
                  media: media,
                  charge: 24,
                  serviceManName: "Rakib",
                  serviceType: "Laundry",
                  serviceManImage:
                      "https://static.vecteezy.com/system/resources/thumbnails/006/859/348/small/young-boy-indian-student-portrait-photo.jpg",
                  rating: 3.7,
                ),
                ServiceCard(
                  media: media,
                  charge: 24,
                  serviceManName: "Zillu",
                  serviceType: "Reparing",
                  serviceManImage:
                      "https://t3.ftcdn.net/jpg/06/99/46/60/240_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg",
                  rating: 4.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String serviceType;
  final String serviceManName;
  final String serviceManImage;
  final double charge;
  final double rating;

  const ServiceCard({
    super.key,
    required this.media,
    required this.serviceType,
    required this.serviceManName,
    required this.charge,
    required this.serviceManImage,
    required this.rating,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: media.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 197, 227, 244),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                serviceManImage,
                height: 120,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "$rating",
                      style: TextStyle(
                        color: Color(0xFF284a79),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  serviceType,
                  style: const TextStyle(
                    color: Color(0xFF284a79),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  serviceManName,
                  style: const TextStyle(
                    color: Color(0xFF284a79),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: ColoredBox(
                          color: const Color(0xFF284a79),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "\$${charge.toStringAsFixed(1)}/Hour",
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
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: const ColoredBox(
                          color: Color(0xFFFB631A),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "Book Now",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            image,
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF284a79),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
