
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboard_controller.dart';
import '../widgets/onboarding/custombotton.dart';
import '../widgets/onboarding/dotscontroller.dart';
import '../widgets/onboarding/slider.dart';

class OnBoard extends StatelessWidget {
  // const OnBoard({super.key});
      

  @override
  Widget build(BuildContext context) {
    Get.put(OnBaordControllerImp());
    return const  Scaffold(
        body: SafeArea(
      child: Column(
        children:  [
          Expanded(
            flex: 3,
            // height: 600,
            child: SliderOnBoarding()
          ),
          // SizedBox(height: 100,)
          
          Expanded(
            flex: 1,
            child: Column(
              children:[
                Dotsonboarding(),
                // const SizedBox(height: ,),
                // Spacer(flex: 1,),
              // const  SizedBox(height: 20,),  
              Spacer(flex: 2,),
                CustomButton()
              ],
            )
          )
        ],
      ),
    ));
  }
}


