import 'package:appdemo/departments/get_department_list.dart';
import 'package:appdemo/services/department_model.dart';

Future<List<DepartmentData>?> DataList() async {
  final List<DepartmentData>? dataList = await getDataDepartmentFromApi();

  // Lọc danh sách dựa trên điều kiện
  return dataList;
}

List<DepartmentData> _department = [];
void fetchDepartmentData() async {
  _department = (await DataList())!;
}

List<String> getUniqueNames(List<Map<String, dynamic>> apiList) {
  Set<String> uniqueNames =
      {}; // Sử dụng Set để lưu trữ các giá trị name duy nhất

  for (var item in apiList) {
    if (item.containsKey("id")) {
      uniqueNames.add(item['id']);
    }
  }

  // Chuyển Set thành List (nếu cần)
  List<String> uniqueNamesList = uniqueNames.toList();

  return uniqueNamesList;
}

List<Map<String, String>> convertNameToMap(List<DepartmentData> apiList) {
  return apiList.map((item) {
    return {
      "id": item.id as String,
    };
  }).toList();
}

List<Map<String, String>> nameMapList = convertNameToMap(_department);

List departmentName = getUniqueNames(nameMapList);
