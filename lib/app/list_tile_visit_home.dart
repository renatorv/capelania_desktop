import 'package:fluent_ui/fluent_ui.dart';

import 'core/utils/kcolors.dart';
import 'models/visit.dart';

class ListTileVisitHome extends StatefulWidget {
  final Visit visit;
  const ListTileVisitHome({super.key, required this.visit});

  @override
  State<ListTileVisitHome> createState() => _ListTileVisitHomeState();
}

class _ListTileVisitHomeState extends State<ListTileVisitHome> {
  final _obsEc = TextEditingController();

  @override
  void initState() {
    super.initState();
    _obsEc.text = widget.visit.description;
  }

  @override
  void dispose() {
    _obsEc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Container(
          width: screenWidth * .4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Kolors.kWhite,
            boxShadow: const [
              BoxShadow(color: Kolors.kRed, spreadRadius: 1),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * .4,
                child: ListTile(
                  title: Text(
                    widget.visit.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      rowVisit('Endereço: ', widget.visit.address),
                      rowVisit('Telefone: ', widget.visit.phone),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Data ',
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '${widget.visit.dateOfVisit.substring(8, 10)}/${widget.visit.dateOfVisit.substring(5, 7)}/${widget.visit.dateOfVisit.substring(0, 4)}',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      rowVisit('Responsável: ', widget.visit.responsible),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Realizada? ',
                          style: const TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.visit.visitMade ? 'Sim' : 'Não',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4, right: 4),
                child: SizedBox(
                  height: screenHeight * .28,
                  width: screenWidth * .5,
                  child: TextBox(
                    minLines: 5,
                    maxLines: 10,
                    controller: _obsEc,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: Kolors.kRed,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
