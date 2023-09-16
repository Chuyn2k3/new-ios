import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/data_model.dart';

Future<List<Data>?> getDataFromApi() async {
    // Gọi API và nhận dữ liệu
    final GetDataModel? apiResponse = await DemoAPI().dioGetData();

    // Trích xuất danh sách kiểu Data từ apiResponse
    final List<Data>? dataJsonList = apiResponse!.data!.toList();

    // Chuyển đổi danh sách JSON thành danh sách kiểu Data
    // final List<Data> dataList = dataJsonList!.map((dataJson) {
    //   return Data.fromJson(dataJson as Map<String, dynamic>);
    // }).toList();

    return dataJsonList;
  }