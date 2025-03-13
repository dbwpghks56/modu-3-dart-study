import 'dart:math';

class Cleric {
  String name;
  int hp = 50;
  final int maxHp = 50;
  int mp = 10;
  final int maxMp = 10;

  Cleric(this.name);

  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('$name 은(는) 체력이 회복되었다.');
    } else {
      print('$name 은(는) MP가 부족하여 회복을 할 수 없다.');
    }
  }

  int pray(int sec) {
    final int recover = sec + Random().nextInt(3);
    final int recoverActual = mp + recover > maxMp ? maxMp - mp : recover;
    mp += recoverActual;
    print('$name 은(는) $sec 초 기도하여 $recoverActual MP가 회복되었다.');
    return recoverActual;
  }
}
