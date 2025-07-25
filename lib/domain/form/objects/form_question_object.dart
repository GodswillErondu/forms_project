import 'package:forms_project/domain/core/_enums.dart';
import 'package:forms_project/domain/form/objects/question_option_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_question_object.freezed.dart';

@freezed
abstract class FormQuestionObject with _$FormQuestionObject {
  const FormQuestionObject._();

  const factory FormQuestionObject({
    required String id,
    required String title,
    @Default('') String description,
    required FormInputTypeEnum type,
    required bool required,
    required int order,
    List<QuestionOptionObject>? options,
  }) = _FormQuestionObject;

  factory FormQuestionObject.empty() => FormQuestionObject(
    id: '',
    title: '',
    description: '',
    type: FormInputTypeEnum.shortText,
    required: false,
    order: 0,
    options: null,
  );
}
