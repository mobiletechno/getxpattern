import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../home/models/Home_list_model.dart';



class CartTileWidget extends StatelessWidget {
  final HomeListModel productDataModel;

  const CartTileWidget(
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
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.slug!))),
          ),
          const SizedBox(height: 20),
          Text(productDataModel.slug!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.slug!),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productDataModel.slug.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        // cartBloc.add(CartRemoveFromCartEvent(
                        //     productDataModel: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
