import 'package:appdemo/services/api.dart';
import 'package:appdemo/departments/department_model.dart';

Future<List<DepartmentData>?> getDataDepartmentFromApi() async {
  final DepartmentModel? apiResponse = await DemoAPI().dioGetDepartmentData();
  final List<DepartmentData> dataJsonList = apiResponse!.data!.toList();
  return dataJsonList;
}
