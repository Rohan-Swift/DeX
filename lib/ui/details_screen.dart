import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expenditure/controllers/firebase_controller.dart';
import 'package:expenditure/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final ListController listController = Get.put(ListController());
  final FirebaseController fb = Get.put(FirebaseController());
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        //listController.changeIndex(-1);
        fb.selectedIndex.value = -1;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
          //leading: const InkWell(
          //child: Icon(Icons.chevron_left),
          //),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kolli Hills Total Cost',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetX<FirebaseController>(builder: (c) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: c.items.value.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        double overallSum=0.0;
                        c.items.value.forEach((element) {
                          overallSum+=double.parse(element.expenses![0].toString());
                        });
                        return c.selectedIndex.value == index
                            ? InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  setState(() {
                                    log("before: ${fb.selectedIndex.value.toString()}");
                                    fb.selectedIndex.value = index;
                                    log("after: ${fb.selectedIndex.value.toString()}");
                                  });
                                },
                                child: Container(
                                  width: w * 0.85,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF383837),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              c.items.value[index].itemTitle
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(Icons.edit),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${c.items.value[index].expenses?[0].toString()}",
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 22,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: w * 0.5,
                                              child: TextFormField(
                                                onChanged: (value) {},
                                                controller: controller,
                                                focusNode: focusNode,
                                                autofillHints: const [
                                                  AutofillHints.email
                                                ],
                                                keyboardType:
                                                    TextInputType.number,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                onFieldSubmitted:
                                                    (String text) {},
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: InputDecoration(
                                                    focusColor:
                                                        Colors.transparent,
                                                    filled: true,
                                                    fillColor:
                                                        const Color(0xff1E1F20),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 0,
                                                              style: BorderStyle
                                                                  .none),
                                                    ),
                                                    hintText: "Enter amount",
                                                    hintStyle: const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xff767676),
                                                        letterSpacing: 1)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (controller.text != "") {
                                                  FirebaseFirestore.instance
                                                      .collection(
                                                          "exCollection")
                                                      .doc(
                                                          "UpSf8DEwZZ3iNEuOScAt")
                                                      .collection("items")
                                                      .doc(c.items.value[index]
                                                          .docId
                                                          .toString())
                                                      .update({
                                                    "expenses": [
                                                      double.parse(
                                                          controller.text)
                                                    ]
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: w * 0.15,
                                                height: 55,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue,
                                                ),
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.black,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  //fb.changeIndex(index);

                                  log("before: ${fb.selectedIndex.value.toString()}");

                                  fb.selectedIndex.value = index;
                                  log("After: ${fb.selectedIndex.value.toString()}");

                                  setState(() {});
                                },
                                child: Container(
                                  width: w * 0.85,
                                  // height: h * 0.17,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF383837),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              c.items.value[index].itemTitle
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 24),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Icon(Icons.edit),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${c.items.value[index].expenses?[0].toString()}",
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 22),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Sum: ',
                                              style: TextStyle(fontSize: 22),
                                            ),
                                            Text(
                                              '${overallSum}',
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 24,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 20,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
