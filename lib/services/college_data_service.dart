import 'package:college_competitions/models/ChooseCollege.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';

class CollegeDataService {
  Future<List<ChooseCollege>> getCollegeFromName(String name) async {
    Dio dio = Dio();
    Response response = await dio.get("http://universities.hipolabs.com/search",
        queryParameters: {'name': name, 'country': 'United States'});
    List<ChooseCollege> colleges = [];
    for (Map<String, dynamic> college in response.data) {
      colleges.add(ChooseCollege.fromJson(college));
    }

    if (colleges.length > 20) {
      colleges.removeRange(20, colleges.length);
    }

    List<Future<ChooseCollege>> requests = [];
    for (ChooseCollege college in colleges) {
      requests.add(getCollegeImage(college));
    }
    colleges = await Future.wait(requests);

    return colleges;
  }

  Future<ChooseCollege> getCollegeImage(ChooseCollege college) async {
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

  Future<Location> getLocationFromAddress(String address) async {
    List<Location> location = await locationFromAddress(address);
    return location[0];
  }
}
