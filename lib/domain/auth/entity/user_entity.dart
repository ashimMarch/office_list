
import 'package:equatable/equatable.dart';

class UserData extends Equatable{
  const UserData({
    required this.username, 
    required this.userId, 
    required this.officeId, 
    required this.officeName,
  });

  final String username;
  final int userId;
  final int officeId;
  final String officeName;

  @override
  List<Object?> get props => [userId];

  @override
  String toString() {
    return 'UserData( username: $username, userId: $userId, officeId: $officeId, officeName: $officeName)';
  }

}
