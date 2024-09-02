import 'package:bloc/bloc.dart';

import '../../../../../models/visit.dart';
import '../../../../utils/api_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  Future<void> getVisit() async {
    final ApiService apiService = ApiService();
    List<Visit> visits = [];

    emit(HomeLoading());

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
          emit(HomeSuccess(visits.reversed.toList()));
        }),
      );
    } catch (e) {
      emit(HomeError('Não foi possível carregar a lista de visitas!'));
    }
  }
}
