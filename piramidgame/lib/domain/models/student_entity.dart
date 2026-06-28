import 'package:equatable/equatable.dart';
import 'package:piramidgame/domain/models/criterio_entity.dart';

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
  final String name;
  final CourseClass course;
  final int year;
  final String nickname;
  final DateTime birthdate;

  Student({
    required this.name,
    required this.course,
    required this.year,
    required this.nickname,
    required this.birthdate,
  }) {
    _validate();
  }

  void _validate() {
    if (year < 1996 || year > 2026) {
      throw ArgumentError('Ano inválido, deve ser entre 1996 e 2026');
    }
  }

  Student copyWith({
    String? name,
    CourseClass? course,
    int? year,
    String? nickname,
    DateTime? birthdate,
  }) {
    return Student(
      name: name ?? this.name,
      course: course ?? this.course,
      year: year ?? this.year,
      nickname: nickname ?? this.nickname,
      birthdate: birthdate ?? this.birthdate,
    );
  }

  @override
  List<Object?> get props => [name, course, year, nickname, birthdate];

  @override
  String toString() {
    return 'Student(name: $name, course: ${course.course}, year: $name, nickname: $nickname, birthdate: $birthdate)';
  }
}
