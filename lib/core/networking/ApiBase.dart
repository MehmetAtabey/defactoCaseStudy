import 'package:http/http.dart' as http;
import 'CustomException.dart';

class ApiBase {
  dynamic responseNetwork(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        return response.body.toString();
      case 400:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

}
