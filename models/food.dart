import 'package:equatable/equatable.dart';

class Food extends Equatable {
  final String name;
  final int price;
  final String image;

  const Food({required this.name, required this.price, required this.image});

  @override
  List<Object?> get props => [name, price, image];
}

List<Food> foodies = [
  Food(name: 'Seoul\nTteokbokki', price: 16000, image: 'topokki.jpg'),
  Food(name: 'Odeng\nTteokbokki', price: 18000, image: 'topokki_odeng.jpg'),
  Food(name: 'Busan\nRabokki', price: 18000, image: 'rabokki.jpg'),
  Food(name: 'Moza\nTteokbokki', price: 18000, image: 'topokki_moza.jpg')
];
