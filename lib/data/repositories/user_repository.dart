import '../../data/dummy/dummy_user.dart';
import '../../models/user_model.dart';

class UserRepository {
  UserModel getCurrentUser() {
    return dummyUser;
  }
}