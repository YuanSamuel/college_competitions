import 'package:college_competitions/models/College.dart';
import 'package:college_competitions/models/User.dart';

class UserService {
  College getUserCollege(User user, List<College> allColleges) {
    return allColleges
        .firstWhere((College college) => college.name == user.college);
  }
}
