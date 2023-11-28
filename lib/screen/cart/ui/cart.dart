import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';


import '../bind_controllers/cart_controller.dart';
import 'cart_tile_widget.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget{

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body:  Obx(() => controller.isLoading.isTrue
          ? Center(
          child: CupertinoActivityIndicator())
          :ListView.builder(
                  itemCount: controller.RxHomeList.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(

                        productDataModel: controller.RxHomeList[index]);
                  })));

          }




  }

