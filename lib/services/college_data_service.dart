import 'package:college_competitions/models/College.dart';
import 'package:dio/dio.dart';

class CollegeDataService {
  Future<List<College>> getCollegeFromName(String name) async {
    Dio dio = Dio();
    Response response = await dio.get("http://universities.hipolabs.com/search",
        queryParameters: {'name': name});
    List<College> colleges = [];
    for (Map<String, dynamic> college in response.data) {
      colleges.add(College.fromJson(college));
    }

    List<Future<College>> requests = [];
    for (College college in colleges) {
      requests.add(getCollegeImage(college));
    }
    colleges = await Future.wait(requests);

    return colleges;
  }

  Future<College> getCollegeImage(College college) async {
    if (college.domains.isNotEmpty) {
      try {
        Dio dio = Dio();
        Response response = await dio.get(
            "https://logo.clearbit.com/${college.domains[0]}",
            options: Options(responseType: ResponseType.bytes));
        college.logo = response.data;
      } catch (e) {}
    }

    return college;
  }
}
