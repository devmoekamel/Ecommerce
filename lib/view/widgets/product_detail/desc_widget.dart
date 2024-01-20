
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/app/productdetails_controller.dart';

class ProuctDesc extends GetView<ProductDetailControllerImp> {
  const ProuctDesc({
    super.key,
    
  });



  @override
  Widget build(BuildContext context) {
    return Text(
      "${controller.itemsModel.itemsDesc}",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
