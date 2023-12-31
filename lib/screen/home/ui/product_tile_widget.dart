import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../app_config/app_constant.dart';
import '../models/Home_list_model.dart';



class ProductTileWidget extends StatelessWidget {
  final HomeListModel productDataModel;

  const ProductTileWidget(
      {super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
height: AppConstant.RESPONSIVEHEIGHT*20,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://images.livemint.com/rf/Image-920x613/LiveMint/Period2/2017/10/31/Photos/Processed/fruits-kFLF--621x414@LiveMint.jpg"))),
          ),
          const SizedBox(height: 20),
      SizedBox(width: AppConstant.RESPONSIVEWIDTH*80, child:Text(productDataModel.slug!,overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          SizedBox(width: AppConstant.RESPONSIVEWIDTH*80,child:Text(productDataModel.slug!,overflow: TextOverflow.ellipsis)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: AppConstant.RESPONSIVEWIDTH*60, child:Text(productDataModel.slug!,overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(HomeProductCartButtonClickedEvent(
                        //     clickedProduct: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
