import 'dart:developer';

import '../../core/exceptions/user_notfount_exception.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      var message = 'Erro ao registrar usuário';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message);
    }
    return UserModel.fromJson('source');
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient
        .post('/auth/', {'email': email, 'password': password});

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundException('Usuário ou senha inválidos');
      }
      log(
        'Erro ao autenticar o usuário (${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
    }
    return UserModel.fromMap(result.body);
  }
}
