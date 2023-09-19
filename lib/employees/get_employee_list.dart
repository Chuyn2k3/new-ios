import 'package:appdemo/employees/employee_model.dart';
import 'package:appdemo/services/api.dart';

Future<List<EmployeeData>?> getDataEmployeeFromApi() async {
  final EmployeeModel? apiResponse = await DemoAPI().dioGetEmployeeData();
  final List<EmployeeData> dataJsonList = apiResponse!.data!.toList();
  return dataJsonList;
}
