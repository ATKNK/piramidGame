import 'criterion_entity.dart';
import 'student_entity.dart';

class StudentMapper {
  static Map<String, dynamic> toMap(Student student) {
    return {
      'id': student.id,
      'name': student.name,
      'course': student.course.course,
      'year': student.year,
      'nickname': student.nickname,
      'birthdate': student.birthdate.toIso8601String(),
      'criteria': student.criteria
          .map((c) => {'criterion': c.criterion.displayName, 'stars': c.stars})
          .toList(),
    };
  }

  static Student fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as String,
      name: map['name'] as String,
      course: CourseClass.values.firstWhere(
        (course) => course.course == map['course'] as String,
      ),
      year: map['year'] as int,
      nickname: map['nickname'] as String,
      birthdate: DateTime.parse(map['birthdate'] as String),
      criteria: (map['criteria'] as List)
          .map(
            (c) => Criterion(
              criterion: CriterionClass.values.firstWhere(
                (e) => e.displayName == c['criterion'],
              ),
              stars: c['stars'],
            ),
          )
          .toList(),
    );
  }
}
