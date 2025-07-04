
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_option_object.freezed.dart';

@freezed
abstract class QuestionOptionObject with _$QuestionOptionObject {
  const QuestionOptionObject._();
  const factory QuestionOptionObject({
    required String id,
    required int order,
    @Default('') String title,
    @Default('') String description,
    String? fileUrl,
    String? mimeType,
  }) = _QuestionOptionObject;

  factory QuestionOptionObject.empty() => const QuestionOptionObject(
    id: '',
    order: 0,
    title: '',
    description: '',
    fileUrl: null,
    mimeType: null,
  );
}
  

