import 'package:expenditure/controllers/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fb = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    //var h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expenditure',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'This month',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 50,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          fb.items.bindStream(fb.connectToItems(
                              "UpSf8DEwZZ3iNEuOScAt"));
                          Get.to(() => const DetailsScreen());
                        },
                        child: Container(
                          width: w * 0.3,
                          height: w * 0.01,
                          decoration: BoxDecoration(
                            color: const Color(0xff272525),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Kolli Hills Total Cost ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Spacer(),
                                Text(
                                  '₹34283',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: SizedBox(
          width: w,
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: w * 0.6,
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xff272525),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Total:  ',
                        style: TextStyle(fontSize: 26),
                      ),
                      Text(
                        '₹34283',
                        style: TextStyle(color: Colors.blue, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xff272525),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
