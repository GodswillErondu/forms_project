import 'package:freezed_annotation/freezed_annotation.dart';
import 'form_question_object.dart';

part 'form_object.freezed.dart';

@freezed
abstract class FormObject with _$FormObject {
  const FormObject._();

  const factory FormObject({
    required String id,
    required String author,
    required List<String> to,
    required String title,
    @Default('') String subtitle,
    @Default('') String description,
    required DateTime dateCreated,
    required DateTime dateModified,
    required bool isPublished,
    String? thumbnailUrl,
    required String themeColorHex,
    required String backgroundColorHex,
    required String titleColorHex,
    int? maxQuestionsToAnswer,
    // required List<FormQuestionObject> questions,
  }) = _FormObject;

  factory FormObject.empty() =>
      FormObject(
        id: '',
        author: '',
        to: [],
        title: '',
        subtitle: '',
        description: '',
        dateCreated: DateTime.now(),
        dateModified: DateTime.now(),
        isPublished: false,
        thumbnailUrl: null,
        themeColorHex: '#FFFFFF',
        backgroundColorHex: '#FFFFFF',
        titleColorHex: '#000000',
        maxQuestionsToAnswer: null,
        // questions: [],
      );
}
