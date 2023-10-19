/*
part of 'fav_cubit.dart';

abstract class FavState {}

class FavInitial extends FavState {}
class FavProductLoadingState extends FavState {}
class FavProductSuccessState extends FavState {}
class FavProductErrorState extends FavState {
  final HttpError error;
  FavProductErrorState(this.error);
}


class GetAllFavProductsLoadingState extends FavState {}
class GetAllFavProductsSuccessState extends FavState {}
class GetAllFavProductsEmptyState extends FavState {}
class GetAllFavProductsErrorState extends FavState {
  final HttpError error;
  GetAllFavProductsErrorState(this.error);
}

class ToggleAddToCart extends FavState {}
*/
