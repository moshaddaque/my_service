import 'package:flutter/material.dart';
import 'package:my_service/views/OtpConfirmationScreen/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryCode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  void initState() {
    countryCode.text = "+88";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/logo_my_service.png",
                    ),
                    radius: 90,
                  ),
                  SizedBox(
                    height: media.height * .1,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextField(
                            controller: countryCode,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        const Text(
                          "|",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 40,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: phoneNumber,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Mobile Number",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              hintStyle: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "An OTP will be sent on given phone number for verification.Standard message and data rates apply.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: media.height * .1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF283891),
                      ),
                      child: const Text(
                        "Login/Sign up",
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
          ),
        ),
      ),
    );
  }
}
