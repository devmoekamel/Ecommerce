import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:loader_skeleton/loader_skeleton.dart';

import '../constant/imageasset.dart';
import 'status_response.dart';

class HandelingView extends StatelessWidget {
  final StatusResponse statusResponse;
  final Widget widget;
  
  HandelingView({required this.statusResponse, required this.widget,
 });

  @override
  Widget build(BuildContext context) {
    return statusResponse == StatusResponse.loading
        ? CardPageSkeleton(
            totalLines: 10,
          )
        : statusResponse == StatusResponse.networkfailure
            ? Center(
                child:Lottie.asset(AppImagAsset.offline, width: 200.w, height: 200.h),)
                    
            : statusResponse == StatusResponse.serverfailure
                ? Center(
                    child: Lottie.asset(AppImagAsset.server,
                        width: 200.w, height: 200.h))
                : statusResponse == StatusResponse.failure
                    ? Center(
                        child: Lottie.asset(AppImagAsset.nodata,
                            width: 200.w, height: 200.h))
                    : widget;
  }
}

//  Center(child: Lottie.asset(AppImagAsset.loading,width: 200,height: 200))

class HandelingViewReq extends StatelessWidget {
  final StatusResponse statusResponse;
  final Widget widget;
  HandelingViewReq({required this.statusResponse, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusResponse == StatusResponse.loading
        ? Center(
            child: Lottie.asset(AppImagAsset.bloading, width: 200.w, height: 200.h))
        : statusResponse == StatusResponse.networkfailure
            ? Center(
                child:
                    Lottie.asset(AppImagAsset.offline, width: 200.w, height: 200.h))
            : statusResponse == StatusResponse.serverfailure
                ? Center(
                    child: Lottie.asset(AppImagAsset.server,
                        width: 200.w, height: 200.h))
                : widget;
  }
}
