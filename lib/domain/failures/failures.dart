abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  @override
  String get message => "Aduh kak lagi gak bisa nih";
}

class CacheFailure extends Failure {
  @override
  String get message => "Biasanya gak gini sih kak, bingung juga";
}

class GeneralFailure extends Failure {
  @override
  String get message => "Yah error dikit kak, emang suka gitu kadang-kadang. Mungkin bisa coba lagi";
}