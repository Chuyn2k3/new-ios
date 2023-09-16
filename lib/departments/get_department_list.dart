import 'package:appdemo/services/api.dart';
import 'package:appdemo/services/data_model.dart';
import 'package:appdemo/services/department_model.dart';

Future<List<DepartmentData>?> getDataDepartmentFromApi() async {
    // Gọi API và nhận dữ liệu
    final DepartmentModel? apiResponse = await DemoAPI().dioGetDepartmentData();

    // Trích xuất danh sách kiểu Data từ apiResponse
    final List<DepartmentData>? dataJsonList = apiResponse!.data!.toList();

    // Chuyển đổi danh sách JSON thành danh sách kiểu Data
    // final List<Data> dataList = dataJsonList!.map((dataJson) {
    //   return Data.fromJson(dataJson as Map<String, dynamic>);
    // }).toList();

    return dataJsonList;
  }