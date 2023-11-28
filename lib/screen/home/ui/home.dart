import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bind_controllers/home_controller.dart';
import 'product_tile_widget.dart';
import 'package:get/get.dart';


class Home extends StatelessWidget {

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Rajkumar Flutter Bloc App'),
                actions: [
                  IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ),
              body: Obx(() => controller.isLoading.isTrue
                  ? Center(
                  child: CupertinoActivityIndicator())
                  :ListView.builder(
                  itemCount: controller.RxHomeList.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(

                        productDataModel: controller.RxHomeList[index]);
                  }),
            ));

        }


  }
