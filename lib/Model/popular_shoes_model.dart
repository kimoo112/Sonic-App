import '../Helpers/images.dart';

class PopularShoesModel {
  final String model;
  final dynamic image;
  final double price;
  final int id;

  PopularShoesModel( 
      {required this.model, required this.id,required this.image, required this.price});
}

List<PopularShoesModel> getPopularShoes = [
  PopularShoesModel(
      image: Assets.imagesHomeShoes1, model: 'Nike Jordan', price: 640, id: 1),
  PopularShoesModel(
      image: Assets.imagesHomeShoes2, model: 'Nike Air Max', price: 750, id: 2),
  PopularShoesModel(
      image: Assets.imagesHomeShoes3, model: 'Nike Club Max', price: 450, id: 3),
  PopularShoesModel(
      image: Assets.imagesHomeShoes4, model: 'Nike Air Max 200', price: 500, id: 4),
      PopularShoesModel(
      image: Assets.imagesHomeShoes5, model: 'Nike 270 Essential', price: 700, id: 5),
      PopularShoesModel(
      image: Assets.imagesHomeShoes6, model: 'Nike Club Max 303', price: 240, id: 6),
];
