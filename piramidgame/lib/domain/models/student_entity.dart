import 'package:equatable/equatable.dart';
import 'criterion_entity.dart';

enum CourseClass {
  info('INFO'),
  mec('MEC'),
  mamb('MAMB'),
  prod('PROD'),
  tads('TADS'),
  tga('TGA');

  final String course;
  const CourseClass(this.course);
}

class Student extends Equatable {
  final String id;
  final String name;
  final CourseClass course;
  final int year;
  final String nickname;
  final DateTime birthdate;
  final List<Criterion> criteria;

  Student({
    required this.id,
    required this.name,
    required this.course,
    required this.year,
    required this.nickname,
    required this.birthdate,
    required this.criteria,
  }) {
    _validate();
  }

  void _validate() {
    if (year < 1998 || year > 2026) {
      throw ArgumentError('Ano inválido, deve ser entre 1998 e 2026');
    }
  }

  int get legendLevel {
    int sum = 0;
    for (Criterion c in criteria) {
      sum += c.stars;
    }

    return sum;
  }

  Student copyWith({
    String? id,
    String? name,
    CourseClass? course,
    int? year,
    String? nickname,
    DateTime? birthdate,
    List<Criterion>? criteria,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      course: course ?? this.course,
      year: year ?? this.year,
      nickname: nickname ?? this.nickname,
      birthdate: birthdate ?? this.birthdate,
      criteria: criteria ?? this.criteria,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    course,
    year,
    nickname,
    birthdate,
    criteria,
  ];

  @override
  String toString() {
    return 'Student(id: $id, name: $name, course: ${course.course}, year: $year, nickname: $nickname, birthdate: $birthdate, criteria: $criteria)';
  }
}
