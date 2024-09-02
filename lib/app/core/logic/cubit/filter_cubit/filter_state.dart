import '../../../../models/visit.dart';

abstract class FilterState {}

class FilterInitial extends FilterState {}

class FilterLoading extends FilterState {}

class FilterSuccess extends FilterState {
  FilterSuccess(this.visits);

  final List<Visit> visits;
}

class FilterError extends FilterState {
  FilterError(this.error);
  final String error;
}
