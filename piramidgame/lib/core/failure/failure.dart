sealed class Failure implements Exception {
  final String msg;
  Failure(this.msg);

  @override
  String toString() => '$runtimeType: $msg!!!';
}

class DefaultFailure extends Failure {
  DefaultFailure([String? msg]) : super(msg ?? 'Erro inesperado');
}

class ApiLocalFailure extends Failure {
  ApiLocalFailure([String? msg])
    : super(msg ?? 'Erro ao acessar armazenamento local');
}

class EmptyResultFailure extends Failure {
  EmptyResultFailure([String? msg])
    : super(msg ?? 'Erro ao procurar resultados');
}
