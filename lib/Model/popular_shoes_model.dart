import '../Helpers/images.dart';

class PopularShoesModel {
  final String model;
  final dynamic image;
  final int price;

  PopularShoesModel(
      {required this.model, required this.image, required this.price});
}

List<PopularShoesModel> getPopularShoes = [
  PopularShoesModel(image:Assets.imagesHomeShoes1 , model: 'Nike Jordan', price: 302),
  PopularShoesModel(image:Assets.imagesHomeShoes2 , model: 'Nike Air Max', price: 750)
];
