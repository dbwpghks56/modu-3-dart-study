import 'package:modu_3_dart_study/2025-04-07/dto/user_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/mapper/user_mapper.dart';
import 'package:modu_3_dart_study/2025-04-07/model/user.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/user_repository.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/enums/registration_error.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(super.dataSource, super.dto);

  bool _validEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  bool _validPassword(String password) {
    return (password.length > 6);
  }

  bool _validError(UserDto dto) {
    return dto.errorMessage != null;
  }

  @override
  Future<Result<User, RegistrationError>> registerUser({
    required String email,
    required String password,
  }) async {
    if (!_validEmail(email)) {
      return Result.error(RegistrationError.invalidEmail);
    }

    if (!_validPassword(password)) {
      return Result.error(RegistrationError.weakPassword);
    }

    final UserDto userDto = (await dataSource.registerUser(
      email: email,
      password: password,
    ));

    if (_validError(userDto)) {
      return Result.error(RegistrationError.networkError);
    }

    return Result.success(userDto.toUser());
  }
}
