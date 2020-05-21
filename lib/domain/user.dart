import 'dart:convert';

class User {
  final String name;
  final String surname;
  User({
    this.name,
    this.surname,
  });

  User copyWith({
    String name,
    String surname,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      name: map['name'],
      surname: map['surname'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, surname: $surname)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User && o.name == name && o.surname == surname;
  }

  @override
  int get hashCode => name.hashCode ^ surname.hashCode;
}
