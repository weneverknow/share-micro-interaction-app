import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String imageUrl;
  final bool isOnline;

  const User(
      {required this.name, required this.imageUrl, this.isOnline = false});

  @override
  List<Object?> get props => [name, imageUrl, isOnline];
}

List<User> users = [
  User(
      name: 'Ricky\nKaka',
      imageUrl: 'https://randomuser.me/api/portraits/men/12.jpg'),
  User(
      name: 'Gianluigi\nBuffon',
      imageUrl: 'https://randomuser.me/api/portraits/men/38.jpg'),
  User(
      name: 'Gianluca\nZambrotta',
      imageUrl: 'https://randomuser.me/api/portraits/men/83.jpg',
      isOnline: true),
  User(
      name: 'Gianluigi\nDonnaruma',
      imageUrl: 'https://randomuser.me/api/portraits/men/46.jpg'),
  User(
      name: 'Andrea\nPirlo',
      imageUrl: 'https://randomuser.me/api/portraits/men/78.jpg'),
  User(
      name: 'Alessandro\nDelpiero',
      imageUrl: 'https://randomuser.me/api/portraits/men/57.jpg'),
  User(
      name: 'Gennaro\nGattuso',
      imageUrl: 'https://randomuser.me/api/portraits/men/81.jpg'),
];
