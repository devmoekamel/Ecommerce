

import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binding/app/fav_binding.dart';
import 'binding/app/home_binding.dart';
import 'binding/app/items_binding.dart';
import 'binding/auth/login_binding.dart';
import 'binding/auth/signup_binding.dart';
import 'binding/auth/verifysign_binding.dart';
import 'binding/forgetpassword/forgetpass_binding.dart';
import 'binding/forgetpassword/resetpass_binding.dart';
import 'binding/forgetpassword/verifycode_binding.dart';
import 'core/constant/approute.dart';
import 'core/middleware/auth_midware.dart';
import 'core/middleware/skip_midware.dart';
import 'view/screens/address/address_add.dart';
import 'view/screens/address/address_edit.dart';
import 'view/screens/address/address_view.dart';
import 'view/screens/app/cart_page.dart';
import 'view/screens/app/fav_page.dart';
import 'view/screens/app/home_screen.dart';
import 'view/screens/app/items_page.dart';
import 'view/screens/app/product_detail.dart';
import 'view/screens/app/setting_page.dart';
import 'view/screens/auth/forgetpassword/forgetpassword.dart';
import 'view/screens/auth/forgetpassword/resetpassword.dart';
import 'view/screens/auth/forgetpassword/success_resetpass.dart';
import 'view/screens/auth/forgetpassword/verifycode.dart';
import 'view/screens/auth/login.dart';
import 'view/screens/auth/signup.dart';
import 'view/screens/auth/success_signup.dart';
import 'view/screens/auth/verifycodesign.dart';
import 'view/screens/language.dart';
import 'view/screens/onboard.dart';

List<GetPage<dynamic>>? routes = [
  //onboard
// GetPage(name: "/", page: () =>test(),binding:testbidning() ) ,

  GetPage(name: "/", page: () => LanguagePage(), middlewares: [SkipMidWare()]),
  GetPage(
      name: AppRoute.onboard,
      page: () => OnBoard(),
      middlewares: [SkipMidWare()]),
  //AUTH
  //  
  GetPage(
      name: AppRoute.login,
      page: () => Login(),
      binding: LoginBinding(),
     middlewares: [AuthMidWare()]
     ),
  GetPage(
      name: AppRoute.signup, page: () => SignUP(), binding: SignupBinding()),
  GetPage(
      name: AppRoute.forgetpassword,
      page: () => ForgetPass(),
      binding: ForgetPassBinding()),
  GetPage(
      name: AppRoute.verifycode,
      page: () => VerifyCode(),
      binding: VerifyCodeBinding()),
  GetPage(
      name: AppRoute.resetpassword,
      page: () => ResetPass(),
      binding: ResetPassBinding()),
  GetPage(name: AppRoute.successresetpass, page: () => SuccessResetPass()),
  GetPage(name: AppRoute.successsignup, page: () => SuccessSignUp()),
  GetPage(
      name: AppRoute.verifycodesign,
      page: () => VerifyCodeSign(),
      binding: VerifySignBinding()),
  // GetPage(name: AppRoute.home, page: () => Home(), binding: HomeBinding()),
  GetPage(
      name: AppRoute.home, page: () => HomeScreen(), binding: HomeBinding()),
  GetPage(
      name: AppRoute.itemspage,
      page: () => ItemsPage(),
      binding: ItemBinding()),

  GetPage(name: AppRoute.productdetails, page: () => ProductDetail()),
  GetPage(name: AppRoute.favpage, page: () => FavPage(), binding: FavBinding()),
  GetPage(name: AppRoute.settings, page: () => settingPage()),
  GetPage(name: AppRoute.cartpage, page: () => CartPage()),
  GetPage(name: AppRoute.address, page: () => AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => AddressAdd()),

  // profile
  GetPage(name: AppRoute.profile, page: () => AddressEdit()),
];
