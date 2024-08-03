abstract class Falure {
  final String message;

  const Falure(this.message);
}

class ServerFailure extends Falure {
  const ServerFailure(super.message);
}
