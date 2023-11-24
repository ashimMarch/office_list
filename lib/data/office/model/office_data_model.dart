import 'package:bank_genie_task/core/utils/type_def.dart';
import 'package:bank_genie_task/domain/office/entity/office_data.dart';

class OfficeDataModel extends OfficeData {
  const OfficeDataModel({
    required super.id, 
    required super.name, 
    required super.nameDecorated, 
    required super.externalId, 
    required super.openingDate, 
    required super.hierarchy
  });

  factory OfficeDataModel.fromMap(DataMap map) {
    return OfficeDataModel(
      id: map['id'],
      name: map['name'],
      nameDecorated: map['nameDecorated'],
      externalId: map['externalId'],
      openingDate: map['openingDate'],
      hierarchy: map['hierarchy'],
    );
  }
}
