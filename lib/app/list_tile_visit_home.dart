import 'package:fluent_ui/fluent_ui.dart';

import 'core/utils/kcolors.dart';
import 'models/visit.dart';

class ListTileVisitHome extends StatelessWidget {
  final Visit visit;
  const ListTileVisitHome({super.key, required this.visit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Kolors.kWhite,
          boxShadow: const [
            BoxShadow(color: Kolors.kRed, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            Container(
              color: Kolors.kGrayLight,
              width: 300,
              child: ListTile(
                title: Text(
                  visit.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rowVisit('Endereço: ', visit.address),
                    rowVisit('Telefone: ', visit.phone),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Data ',
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                '${visit.dateOfVisit.substring(8, 10)}/${visit.dateOfVisit.substring(5, 7)}/${visit.dateOfVisit.substring(0, 4)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    rowVisit('Responsável: ', visit.responsible),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Realizada? ',
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: visit.visitMade ? 'Sim' : 'Não',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              width: 400,
              color: Kolors.kGold,
              child: Text(
                visit.description,
                maxLines: 20,
                style: const TextStyle(
                  fontSize: 14,
                  color: Kolors.kDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget rowVisit(String title, String value) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: title,
      style: const TextStyle(color: Colors.black),
      children: <TextSpan>[
        TextSpan(
          text: value,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    ),
  );
}
