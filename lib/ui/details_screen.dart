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
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        listController.changeIndex(-1);
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
                  GetBuilder<ListController>(builder: (c) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (listController.selectedIndex == index) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              c.changeIndex(index);
                            },
                            child: Container(
                              width: w * 0.85,
                              height: h * 0.2,
                              decoration: BoxDecoration(
                                color: const Color(0xFF383837),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Petrol',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.edit),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '500',
                                      style: TextStyle(
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
                                            controller: controller,
                                            focusNode: focusNode,
                                            autofillHints: const [
                                              AutofillHints.email
                                            ],
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            onFieldSubmitted: (String text) {},
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                                focusColor: Colors.transparent,
                                                filled: true,
                                                fillColor:
                                                    const Color(0xff1E1F20),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none),
                                                ),
                                                hintText: "Enter amount",
                                                hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff767676),
                                                    letterSpacing: 1)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              c.changeIndex(index);
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Petrol',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.edit),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      '500',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 22),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Sum: ',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        Text(
                                          '9000',
                                          style: TextStyle(
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
                        }
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
