/**
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabat/core/utils/utils.dart';
import 'package:sabat/data/model/favorites/AddToFavoriteRequest.dart';

import '../../../data/api/utils/dio_exception.dart';
import '../../../data/api/utils/error_model.dart';
import '../../../data/model/base_result.dart';
import '../../../data/model/favorites/favorites_response.dart';
import '../../../data/repository/repository.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  static FavCubit get(context) => BlocProvider.of(context);

  final _repo = Repository.instance;


  BaseResult? addToFavoriteResponse;
  manageFav({
    int? serviceId,
    int? offerId,
    required Function() onStartLoading,
    required Function() onEndLoading,
    required Function() onNetworkEndLoading,
    required Function() onSuccess,
  }) async {
    onStartLoading();
    emit(FavProductLoadingState());
    try {
      var result = await _repo.manageFavorite(AddToFavoriteRequest(serviceId: serviceId.toString()));
      final response = BaseResult.fromJson(result ?? {});
      if (!(response.success ?? false)) {
        addToFavoriteResponse=response;
        onEndLoading();
        emit(FavProductErrorState(HttpError(message: response.message)));
        return;
      }
      if (response.success ?? false) {
        addToFavoriteResponse=response;
        onSuccess();
        onEndLoading();
        emit(FavProductSuccessState());
      }
    } on DioError catch (e) {
      logger.wtf(e);
      onNetworkEndLoading();
      emit(
        FavProductErrorState(
          HttpError(
            message: DioException.fromDioError(e).httpError?.message.toString(),
          ),
        ),
      );
    } catch (e) {
      logger.wtf(e);
      onNetworkEndLoading();
      emit(FavProductErrorState(HttpError(message: "Unkown Error")));
    }
  }

  FavoritesResponse? favorites;
  bool isFavoriteLoading = false;

  getAllFavoriteProducts() async {
    try {
      isFavoriteLoading = true;
      emit(GetAllFavProductsLoadingState());
      final result = await _repo.getAllFavoriteProducts();
      FavoritesResponse? response = FavoritesResponse.fromJson(result ?? {});
      if (response.success ?? false) {
        favorites = response;
        isFavoriteLoading = false;
        emit(GetAllFavProductsSuccessState());
      } else {
        isFavoriteLoading = false;
        emit(GetAllFavProductsErrorState(HttpError(message: response.message)));
      }
    } on DioError catch (e) {
      logger.wtf(e);
      isFavoriteLoading = false;
      emit(GetAllFavProductsErrorState(HttpError(message: DioException.fromDioError(e).httpError?.message.toString())));
    } catch (e) {
      logger.wtf(e);
      isFavoriteLoading = false;
      emit(GetAllFavProductsErrorState(HttpError(message: "Unkown Error")));
    }
  }


  void setIsAddingToFavoriteProducts(int index,bool isAdding) {
    favorites?.favourites?[index].service?.isAddingToCart = isAdding;
    emit(ToggleAddToCart());
  }

}
*/
