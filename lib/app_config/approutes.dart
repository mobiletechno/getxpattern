

import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screen/cart/bind_controllers/cart_bind.dart';
import '../screen/cart/ui/cart.dart';
import '../screen/home/bind_controllers/home_bind.dart';
import '../screen/home/ui/home.dart';
import '../screen/wishlist/bind_controllers/wish_bind.dart';
import '../screen/wishlist/ui/wishlist.dart';
import 'app_constant.dart';

class Approutes {
  static var list = [
    GetPage(
        name: AppConstant.HOME_NAME,
        page: () => Home(),
        binding: HomeBinding()),
    GetPage(
        name: AppConstant.CART_NAME,
        page: () => Cart(),
        binding: CartBinding()),
    GetPage(
        name: AppConstant.WISHLIST_NAME,
        page: () => Wishlist(),
        binding: WishBinding()),

    //-------------------tabs
  ];
}
