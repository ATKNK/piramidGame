import 'dart:convert';

import 'package:piramidgame/core/typedefs/types_defs.dart';
import 'package:piramidgame/data/services/student_interface.dart';
import 'package:piramidgame/core/failure/failure.dart';
import 'package:piramidgame/core/patterns/result.dart';
import 'package:piramidgame/domain/models/student_entity.dart';
import 'package:piramidgame/domain/models/student_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class StudentSharedPreferencesImpl implements IStudentLocalStorage {
  static const String _storageKey = 'students';

  @override
  Future<StudentResult> saveStudent(Student student) async {
    try {
      final currentResult = await getAllStudents();

      return await currentResult.fold(
        onSuccess: (students) async {
          final updatedStudents = [...students, student];
          await _saveStudents(updatedStudents);
          return Success(student);
        },
        onFailure: (failure) async {
          if (failure is EmptyResultFailure) {
            await _saveStudents([student]);
            return Success(student);
          }

          return Error(ApiLocalFailure('Erro ao salver aluno'));
        },
      );
    } catch (e) {
      return Error(ApiLocalFailure('Erro ao adicionar aluno'));
    }
  }

  @override
  Future<ListStudentResult> getAllStudents() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getString(_storageKey);

      if (result == null || result.isEmpty) {
        return Error(EmptyResultFailure());
      }

      final decoded = jsonDecode(result) as List<dynamic>;

      final students = decoded
          .map((e) => StudentMapper.fromMap(e as Map<String, dynamic>))
          .toList();

      return Success(students);
    } catch (e) {
      return Error(ApiLocalFailure('Erro ao obter alunos:'));
    }
  }

  @override
  Future<StudentResult> getStudentById(String id) async {
    try {
      final currentResult = await getAllStudents();

      return await currentResult.fold(
        onSuccess: (students) async {
          final index = students.indexWhere((item) => item.id == id);
          if (index == -1) {
            return Error(ApiLocalFailure('Aluno não encontrado por ID'));
          }

          return Success(students[index]);
        },
        onFailure: (Failure errorValue) {
          return Error(ApiLocalFailure('Erro ao encontrar aluno por ID'));
        },
      );
    } catch (e) {
      return Error(ApiLocalFailure('Erro ao encontrar aluno por ID: $e'));
    }
  }

  @override
  Future<StudentResult> updateStudent(Student s) async {
    try {
      final currentResult = await getAllStudents();

      return await currentResult.fold(
        onSuccess: (students) async {
          final index = students.indexWhere((item) => item.id == s.id);

          if (index == -1) {
            return Error(
              ApiLocalFailure('Aluno não encontrado para atualização'),
            );
          }

          final updatedStudents = [...students];
          updatedStudents[index] = s;
          await _saveStudents(updatedStudents);
          return Success(s);
        },

        onFailure: (Failure errorValue) {
          return Error(ApiLocalFailure('Erro ao atualizar aluno: $errorValue'));
        },
      );
    } catch (e) {
      return Error(ApiLocalFailure('Erro ao atualizar aluno: $e'));
    }
  }

  @override
  Future<StudentResult> deleteStudent(Student s) async {
    try {
      final currentResult = await getAllStudents();

      return await currentResult.fold(
        onSuccess: (students) async {
          final index = students.indexWhere((item) => item.id == s.id);

          if (index == -1) {
            return Error(ApiLocalFailure('Aluno não encontrado para remoção'));
          }

          final deletedStudent = students[index];
          final updatedStudents = students.where((item) => item != s).toList();

          await _saveStudents(updatedStudents);
          return Success(deletedStudent);
        },

        onFailure: (Failure errorValue) {
          return Error(ApiLocalFailure('Erro ao remover aluno: $errorValue'));
        },
      );
    } catch (e) {
      return Error(ApiLocalFailure('Erro ao remover aluno: $e'));
    }
  }

  Future<void> _saveStudents(List<Student> students) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = json.encode(
        students.map((s) => StudentMapper.toMap(s)).toList(),
      );
      await prefs.setString(_storageKey, jsonString);
    } catch (e) {
      throw ApiLocalFailure('Erro ao salvar personagens: $e');
    }
  }
}
