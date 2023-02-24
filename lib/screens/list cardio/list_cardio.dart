import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_app/components/appBar.dart';
import 'package:my_app/model/cardio/cardio_controller.dart';
import 'package:my_app/screens/detail%20cardio/detail_cardio.dart';

class ListCardio extends StatefulWidget {
  const ListCardio({Key? key}) : super(key: key);

  @override
  _ListCardioState createState() => _ListCardioState();
}

class _ListCardioState extends State<ListCardio> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CardioController cardioController = Get.put(CardioController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: 'Cardio and Lose weight',
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (cardioController.isLoading.value)
            return Center(
              child: CupertinoActivityIndicator(),
            );
          else
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: cardioController.cardioList.length,
                itemBuilder: (context, index) {
                  var item = cardioController.cardioList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: size.height * 0.2 - 40,
                          width: size.width * 1,
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              'https://i.ytimg.com/vi/2MZSjB1WLFg/maxresdefault.jpg',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        onTap: () => Get.to(DetailCardio(
                          url: item.link!,
                          nameCarido: item.name!,
                          breakTime: item.breakTime!,
                          duration: item.duration!,
                          exerTime: item.exerTime!,
                          focus: item.focus!,
                        )),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 25,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[100],
                          ),
                          child: Text(
                            item.name!,
                            style: TextStyle(
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
        }),
      ),
    );
  }
}
