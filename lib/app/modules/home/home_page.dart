import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';

import '../../core/logic/cubit/home/cubit/home_cubit.dart';
import '../../core/utils/kcolors.dart';
import '../../core/utils/widgets/capelania_button.dart';
import 'widgets/list_tile_visit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    homeCubit.getVisit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitas'),
        actions: [
          IconButton(
              onPressed: () async {
                final bool? result = await context.push('/filter');
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeStates>(
          bloc: homeCubit,
          builder: (context, state) {
            log(state.toString());
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Kolors.kRed),
              );
            } else if (state is HomeSuccess) {
              return const Center(
                child: Text('Deu bom!'),
              );
              // return SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 800,
              //         child: RefreshIndicator(
              //           onRefresh: () => homeCubit.getVisit(),
              //           backgroundColor: Kolors.kRed,
              //           color: Kolors.kOffWhite,
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 10),
              //             child: state.visits.isEmpty
              //                 ? const Center(
              //                     child: Icon(
              //                       Icons.not_interested,
              //                       size: 30,
              //                       color: Kolors.kGray,
              //                     ),
              //                   )
              //                 : ListView.separated(
              //                     scrollDirection: Axis.vertical,
              //                     shrinkWrap: true,
              //                     itemCount: state.visits.length,
              //                     itemBuilder: (context, index) {
              //                       return ListTileVisit(
              //                         visit: state.visits[index],
              //                         homeCubit: homeCubit,
              //                       );
              //                     },
              //                     separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              //                   ),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(height: 30),
              //       // Container(
              //       //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //       //   width: double.infinity,
              //       //   child: CapelaniaButton(
              //       //     label: 'Nova Visita',
              //       //     onPress: () async {
              //       //       final bool? result = await context.push('/add');
              //       //       if (result != null) {
              //       //         if (result) {
              //       //           homeCubit.getVisit();
              //       //         }
              //       //       }
              //       //     },
              //       //     size: 20,
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // );
            
            } else {
              return const Center(
                child: Text('Deu ruim!'),
              );
            }
          },
        ),
      ),
    );
  }
}
