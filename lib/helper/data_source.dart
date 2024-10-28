final List serviceList = [
  {
    "charge": 24.0,
    "serviceManName": "Shauli",
    "serviceType": "Home Cleaning",
    "serviceManImage":
        "https://www.missionphotographe.com/ressources/images-actualites/actualite-204.jpg",
    "serviceImage1":
        "https://imgmedia.lbb.in/media/2020/11/5fa23202ed95ba56602877c7_1604465154757.jpg",
    "serviceImage2":
        "https://www.bespokecleanpro.com.sg/wp-content/uploads/2022/12/Vacuuming.jpg",
    "rating": 3.5,
    "about":
        "This service will help you to clean your home and also help to remove deep stains. Our Service provider will use effective chemicals that will wash your home smoothly and neatly.\nOur home cleaning services:\nBathroom Deep Cleaning\nKitchen Cleaning (Without inside cabinet clean, Kitchen Hood, Exhaust Fan)\nFloor Deep Cleaning\nHome Deep Cleaning\nCommon Space Cleaning (If Need price will be shared accordingly)"
  },
  {
    "charge": 24.0,
    "serviceManName": "Rakib",
    "serviceType": "Laundry",
    "serviceManImage":
        "https://static.vecteezy.com/system/resources/thumbnails/006/859/348/small/young-boy-indian-student-portrait-photo.jpg",
    "serviceImage1": "https://www.hhs1.com/hubfs/shutterstock_373243048.jpg",
    "serviceImage2":
        "https://we-wash.com/wp-content/uploads/2023/07/wew-header.jpg",
    "rating": 3.9,
  },
  {
    "charge": 24.0,
    "serviceManName": "Zillu",
    "serviceType": "Reparing",
    "serviceManImage":
        "https://t3.ftcdn.net/jpg/06/99/46/60/240_F_699466075_DaPTBNlNQTOwwjkOiFEoOvzDV0ByXR9E.jpg",
    "serviceImage1":
        "https://smartdai.com/media-file/images/2024/06/1718882797-s5cr6.jpg",
    "serviceImage2":
        "https://live.staticflickr.com/167/465742728_c1e15eabe7_z.jpg",
    "rating": 4.5,
  }
];

class OnBoardPage {
  final String image;
  final String title;

  OnBoardPage({required this.image, required this.title});
}

final List onBoardList = [
  OnBoardPage(
    image: "assets/images/onboard1.png",
    title: "We Provide Professional Home services at a very friendly price",
  ),
  OnBoardPage(
    image: "assets/images/onboard2.png",
    title: "Easy Service booking & Scheduling",
  ),
  OnBoardPage(
    image: "assets/images/onboard3.png",
    title: "Get Beauty parlor at your home & other Personal Grooming needs",
  ),
];
