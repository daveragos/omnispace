import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:omnispace/App/Service/api/Services/alert_dialog.dart' as Alert;
import 'package:omnispace/App/Service/api/Services/api_constants.dart';
import 'package:omnispace/App/Service/api/Services/api_exceptions.dart';

class API {
  Alert.AlerterDialog alertDialog = Alert.AlerterDialog();
  getRequest({required String route, required BuildContext context}) async {
    //use dio package
    final dio = Dio(BaseOptions(baseUrl: APIConst.API_HUB));
    //handle all errors that could occur using try catch
    try {
      final response = await dio.get(route);
      return response;
    } on DioException catch (e) {
      checkException(e, context);
    } catch (e) {
      alertDialog.showAlert(
          context: context, title: 'Error', content: e.toString());
    }
  }

  void checkException(DioException error, BuildContext context) {
    APIException exception = APIException();
    final List<String> message = exception.getExceptionMessage(error);
    alertDialog.showAlert(
      context: context,
      title: message[0],
      content: message[1],
    );
  }
}
