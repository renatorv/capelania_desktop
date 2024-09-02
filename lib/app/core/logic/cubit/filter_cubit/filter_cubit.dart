import 'package:bloc/bloc.dart';

import '../../../../models/visit.dart';
import '../../../utils/api_service.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  late List<Visit> visitsFiltered = [];
  late List<Visit> visitsBackup = [];

  void filterList(String name, bool madeVisit, List<Visit> visits) {
    visitsFiltered = [];

    if (visitsBackup.length >= visits.length) {
      visits = visitsBackup;
    }

    if (name == '') {
      for (var visit in visits) {
        if (visit.visitMade == madeVisit) {
            visitsFiltered.add(visit);
          }
      }
      visitsBackup = visits;
      emit(FilterSuccess(visitsFiltered.reversed.toList()));
    } else {
      for (var visit in visits) {
        if (visit.name.toUpperCase().contains(name.toUpperCase())) {
          if (visit.visitMade == madeVisit) {
            visitsFiltered.add(visit);
          }
        }
      }

      visitsBackup = visits;

      emit(FilterSuccess(visitsFiltered.reversed.toList()));
    }
  }

  Future<void> getVisit() async {
    final ApiService apiService = ApiService();
    late List<Visit> visits = [];

    emit(FilterLoading());

    try {
      apiService.getAllVisits().then(
        ((value) {
          var aux = value.data['result'];

          for (int i = 0; i < aux.length; i++) {
            visits.add(Visit(
              id: aux[i]['id'],
              name: aux[i]['name'],
              phone: aux[i]['phone'],
              description: aux[i]['description'],
              address: aux[i]['address'],
              createdAt: aux[i]['createdAt'],
              dateOfVisit: aux[i]['dateOfVisit'],
              visitMade: aux[i]['visitMade'],
              responsible: aux[i]['responsible'],
            ));
          }
          visits.sort((a, b) {
            var aDate = a.createdAt;
            var bDate = b.createdAt;
            return aDate.compareTo(bDate);
          });
          emit(FilterSuccess(visits.reversed.toList()));
        }),
      );
    } catch (e) {
      emit(FilterError('Não foi possível carregar a lista de visitas!'));
    }
  }
}
