import 'package:expenditure/ui/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _phoneNode.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome Back!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Please login to your account',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailNode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: _phoneController,
                        focusNode: _phoneNode,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      height: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.lightGreen),
                          ),
                          onPressed: () {
                            Get.to(
                              () =>
                                  OtpScreen(phoneNumber: _phoneController.text),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      height: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.g_mobiledata_rounded,
                              ),
                              Text('Login with Google')
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Dont have an account?',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightGreen),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _phoneController,
//               focusNode: _phoneNode,
//               autofillHints: const [AutofillHints.telephoneNumberLocalSuffix],
//               keyboardType: TextInputType.phone,
//               style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.white,
//                   fontWeight: FontWeight.normal,
//                   letterSpacing: 10),
//               maxLength: 10,
//               decoration: InputDecoration(
//                 counterText: '',
//                 focusColor: Colors.transparent,
//                 filled: true,
//                 fillColor: const Color(0xff1E1F20),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide:
//                       const BorderSide(width: 0, style: BorderStyle.none),
//                 ),
//                 prefixIcon: Icon(
//                   Icons.phone_outlined,
//                   color: Theme.of(context).primaryColor,
//                 ),
//                 hintText: "Enter your phone number",
//                 hintStyle: const TextStyle(
//                     fontSize: 16, color: Color(0xff767676), letterSpacing: 1),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               onTap: () {
//                 Get.to(
//                   () => OtpScreen(phoneNumber: _phoneController.text),
//                 );
//               },
//               child: Text('Proceed '),
//             ),
//           ],
//         ),
