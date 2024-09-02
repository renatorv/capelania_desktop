import 'package:flutter/material.dart';
import '../../../core/logic/cubit/filter_cubit/filter_cubit.dart';
import '../../../models/visit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/kcolors.dart';

class TileVisitFilter extends StatelessWidget {
    final Visit visit;
  final FilterCubit filterCubit;

  const TileVisitFilter({ super.key, required this.visit, required this.filterCubit });

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
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Card(
        color: Kolors.kCardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
                  filterCubit.getVisit();
                }
              }
            },
            child: Ink(width: 40.w, height: 40.h, color: Colors.transparent, child: const Icon(Icons.navigate_next_rounded)),
          ),
        ),
      ),
    );
  }
}
