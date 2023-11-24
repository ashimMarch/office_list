import 'package:equatable/equatable.dart';

class OfficeData extends Equatable{
   const OfficeData({
    required this.id, 
    required this.name, 
    required this.nameDecorated, 
    required this.externalId, 
    required this.openingDate, 
    required this.hierarchy
  });
  final int id;
  final String name;
  final String nameDecorated;
  final String? externalId;
  final List openingDate;
  final String hierarchy;

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'OfficeData(id: $id, name: $name, nameDecorated: $nameDecorated, '
    'externalId: $externalId, openingDate: $openingDate, hierarchy: $hierarchy)';
  }
}
