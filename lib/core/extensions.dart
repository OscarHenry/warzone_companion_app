extension XList on List {
  E getRandom<E>() {
    final list = List<E>.from(this);
    list.shuffle();
    return list.first;
  }
}