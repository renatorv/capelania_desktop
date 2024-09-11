import 'package:capelania_desktop/app/core/logic/cubit/home/cubit/home_cubit.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_manager/window_manager.dart';

import 'core/utils/kcolors.dart';
import 'list_tile_visit_home.dart';
import 'models/menus.dart';
import 'models/new_visit.dart';
import 'models/visit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WindowListener {
  final HomeCubit homeCubit = HomeCubit();
  int index = 0;
  final viewKey = GlobalKey();
  final List<NewVisit> listVisits = [
    NewVisit(
      title: 'Visitas',
      iconData: FluentIcons.page_list_filter,
      nemu: Menus.visit,
    ),
    NewVisit(
      title: 'Nova Visita',
      iconData: FluentIcons.add,
      nemu: Menus.add,
    ),
  ];

  @override
  void initState() {
    windowManager.addListener(this);
    homeCubit.getVisit();
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state is HomeLoading) {
          return Container();
        } else if (state is HomeSuccess) {
          return NavigationView(
            key: viewKey,
            appBar: const NavigationAppBar(
              title: Text(
                'CONTROLE DE VISITAS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              leading: Icon(
                FluentIcons.home,
                size: 26,
              ),
            ),
            pane: NavigationPane(
              selected: index,
              onChanged: (i) => setState(() {
                index = i;
              }),
              displayMode: PaneDisplayMode.compact,
              items: listVisits
                  .map<NavigationPaneItem>(
                    (e) => PaneItem(
                      icon: Icon(e.iconData),
                      body: index == 0
                          ? Container(
                              child: state.visits.isEmpty
                                  ? const Center(
                                      child: Icon(
                                        FluentIcons.clear,
                                        size: 100,
                                        color: Kolors.kGray,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                                      child: ListView.builder(
                                        itemCount: state.visits.length,
                                        itemBuilder: (context, index) {
                                          return ListTileVisitHome(visit: state.visits[index]);
                                        },
                                      ),
                                    ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: ListView.separated(
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: state.visits.length,
                                itemBuilder: (context, index) {
                                  Visit visit = state.visits[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 40,
                                          child: ListTile(
                                            title: Text(visit.name),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(visit.address),
                                                Text(visit.phone),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 60,
                                          child: Container(
                                            padding: const EdgeInsets.all(6),
                                            color: Kolors.kGrayLight,
                                            child: Text(visit.description)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                      title: Text(e.title),
                      onTap: () {
                        print(index);
                      },
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();
    if (isPreventClose) {
      showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (_) {
            return ContentDialog(
              title: const Text('Confirm Close'),
              content: const Text('Are you sure want to close the app?'),
              actions: [
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    windowManager.destroy();
                  },
                  child: const Text('Yes'),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Noe'),
                ),
              ],
            );
          });
    }
    super.onWindowClose();
  }
}
