import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/services/api.dart';


Future<List<EmployeeData>?> getDataEmployeeFromApi() async {
    // Gọi API và nhận dữ liệu
    final EmployeeModel? apiResponse = await DemoAPI().dioGetEmployeeData();

    // Trích xuất danh sách kiểu Data từ apiResponse
    final List<EmployeeData>? dataJsonList = apiResponse!.data!.toList();

    // Chuyển đổi danh sách JSON thành danh sách kiểu Data
    // final List<Data> dataList = dataJsonList!.map((dataJson) {
    //   return Data.fromJson(dataJson as Map<String, dynamic>);
    // }).toList();

    return dataJsonList;
  }