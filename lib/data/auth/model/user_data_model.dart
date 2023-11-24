
import 'package:bank_genie_task/core/utils/type_def.dart';
import 'package:bank_genie_task/domain/auth/entity/user_entity.dart';

class UserDataModel extends UserData{
  const UserDataModel({
    required super.username, 
    required super.userId, 
    required super.officeId, 
    required super.officeName,
  });

  UserDataModel.fromMap(DataMap map): this(
    username: map['username'],
    userId: map['userId'],
    officeId: map['officeId'],
    officeName: map['officeName'],
  );

  DataMap toMap() {
    return {
      'username': username,
      'userId': userId,
      'officeId': officeId,
      'officeName': officeName,
    };
  }
}
