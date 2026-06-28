import 'package:flutter/material.dart';
import 'package:piramidgame/core/patterns/result.dart';
import 'package:piramidgame/core/failure/failure.dart';

import 'package:piramidgame/domain/models/student_entity.dart';

typedef VoidResult = Result<void, Failure>;
typedef StudentResult = Result<Student, Failure>;
typedef ListStudentResult = Result<List<Student>, Failure>;

typedef StudentParams = ({Student s});

typedef FormFieldControl = ({
  GlobalKey<FormFieldState> key,
  FocusNode focus,
  TextEditingController controller,
});
