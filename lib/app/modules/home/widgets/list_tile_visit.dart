import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/logic/cubit/home/cubit/home_cubit.dart';
import '../../../core/utils/kcolors.dart';
import '../../../models/visit.dart';

class ListTileVisit extends StatelessWidget {
  final Visit visit;
  final HomeCubit homeCubit;

  const ListTileVisit({super.key, required this.visit, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    makingPhoneCall(String phoneNumber) async {
      var url = Uri.parse(phoneNumber);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    final phoneMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      type: MaskAutoCompletionType.lazy,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 3.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Kolors.kRed, spreadRadius: 1),
          ],
        ),
        child: ListTile(
          title: Text(visit.name),
          subtitle: GestureDetector(
            onTap: () => makingPhoneCall('tel://${visit.phone}'),
            child: Text(
              phoneMask.maskText(visit.phone),
              style: const TextStyle(color: Kolors.kGray),
            ),
          ),
          trailing: InkWell(
            onTap: () async {
              final bool? result = await context.push('/edit', extra: visit);
              if (result != null) {
                if (result) {
                  homeCubit.getVisit();
                }
              }
            },
            child: Ink(
              width: 40.w,
              height: 40.h,
              color: Colors.transparent,
              child:  Icon(Icons.navigate_next_rounded, size: 36.dg, color: Kolors.kRed,),
            ),
          ),
        ),
      ),
    );
  }
}
