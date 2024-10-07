class UserName {

  String title;
  String first;
  String last;

  UserName({
    required this.title,
    required this.first,
    required this.last
  });

  String get fullName {
    return '$title $first $last';
  }

}