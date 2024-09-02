import 'dart:developer';

import 'package:dio/dio.dart';

import '../../models/create_visit.dart';
import '../../models/edit_visit.dart';
import 'dio_service.dart';

class ApiService {
  final _dio = DioService().dio;

  Future getAllVisits() async {
    final response = await _dio.post('/list-visits');
    log(response.data.toString());
    return response;
  }

  Future<int?> newVisit(CreateVisit createVisit) async {
    dynamic json = {
      "name": createVisit.name,
      "phone": createVisit.phone,
      "description": createVisit.obs,
      "address": createVisit.address,
      "dateOfVisit": createVisit.dateOfVisit,
      "visitMade": createVisit.madeVisit.toString(),
      "responsible": createVisit.responsible,
    };
    try {
      final response = await _dio.post(
        '/create-visit',
        data: json,
      );
      return response.statusCode;
    } on DioException catch (e) {
      Map<String, dynamic> ret = e.response!.data;
      return ret['code'];
    } catch (e) {
      return 400;
    }
  }

  Future<int?> editExistVisit(EditVisitModel editVisit) async {
    dynamic json = {
      "objectId": editVisit.objectId,
      "name": editVisit.name,
      "phone": editVisit.phone,
      "description": editVisit.obs,
      "address": editVisit.address,
      "dateOfVisit": editVisit.dateOfVisit,
      "visitMade": editVisit.madeVisit,
      "responsible": editVisit.responsible
    };

    try {
      final response = await _dio.post('/change-visit', data: json,);
      return response.statusCode;
    } on DioException catch (e) {
      Map<String, dynamic> ret = e.response!.data;
      return ret['code'];
    } catch (e) {
      return 400;
    }
  }
}
