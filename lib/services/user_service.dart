import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/models/User.dart';

class UserService {
  College getUserCollege(User user, List<College> allColleges) {
    return allColleges
        .firstWhere((College college) => college.name == user.college);
  }

  List<int> getLevel(int points) {
    int nextPoints = points;
    int subtract = 300;
    nextPoints -= subtract;
    int levelNum = 1;
    while (nextPoints > 0) {
      levelNum++;
      points -= subtract;
      subtract += 100;
      nextPoints -= subtract;
    }
    return [levelNum, points, subtract];
  }
}
