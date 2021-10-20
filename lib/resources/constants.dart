class Constants {
  static final List<int> birthYears = _getBirthYears();
}

List<int> _getBirthYears() {
  const int pregnantMinAge = 16;
  const int pregnantMaxAge = 70;
  var dateNow = DateTime.now();
  var list = List<int>.generate(pregnantMaxAge - pregnantMinAge,
      (index) => dateNow.year - pregnantMinAge - index).reversed;
  return list.toList();
}
