import 'package:hive/hive.dart';

enum FormInputTypeEnum {
  shortText,
  longText,
  number,
  singleChoice,
  multipleChoice,
  dropdown,
  date,
  time,
  dateRange,
  timeRange,
  slider,
  fileUpload,
}


class FormInputTypeEnumAdapter extends TypeAdapter<FormInputTypeEnum> {
  @override
  final int typeId = 3;

  @override
  FormInputTypeEnum read(BinaryReader reader) {
    return FormInputTypeEnum.values[reader.readInt()];
  }

  @override
  void write(BinaryWriter writer, FormInputTypeEnum obj) {
    writer.writeInt(obj.index);
  }
}