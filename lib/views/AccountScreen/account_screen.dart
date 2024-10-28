import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final height = media.height;
    final width = media.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //==================
                Row(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                        "https://sharedp.com/wp-content/uploads/2024/06/cute-girl-pic-cartoon-960x1024.jpg",
                      ),
                    ),
                    SizedBox(
                      width: width * .03,
                    ),
                    //==================
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Esu Moni",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "+8801796779751",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //==================
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF283891),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 40,
              thickness: 1,
              color: Colors.grey[300],
            ),
            //====================================
            Expanded(
              child: ListView(
                children: [
                  ProfileListItem(
                    icon: Icons.location_on_outlined,
                    title: "Manage Address",
                    onTap: () {
                      toast("Manage Address");
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.share_outlined,
                    title: "Refer & Earn",
                    onTap: () {
                      toast("Refer & Earn");
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.star_border_outlined,
                    title: "Rate Us",
                    onTap: () {
                      toast("Rate Us");
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.info_outline,
                    title: "About MyHome Service",
                    onTap: () {
                      toast("About MyHome Service");
                    },
                  ),
                  ProfileListItem(
                    icon: Icons.logout,
                    title: "Logout",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future toast(String message) async {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      gravity: ToastGravity.TOP,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      fontSize: 16,
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color(0xff161616),
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
    );
  }
}
