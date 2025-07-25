import 'package:get_it/get_it.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/data_source/local/base_data_source/base_user_local_data_source.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/data_source/local/user_hive_local_data_source.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/data_source/remote/authentication_by_firebase_data_source.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/data_source/remote/base_data_source/base_authentication_remote_data_source.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/data_source/remote/base_data_source/base_user_remote_data_source.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/data_source/remote/user_firebase_remote_data_source.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/repositories/authentication_repository.dart';
import 'package:reco_genie_task/features/authentication_feature/data_layer/repositories/user_repository.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/repositories/base_authentication_repository.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/repositories/base_user_repository.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/use_cases/create_user_use_case.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/use_cases/get_remote_user_use_case.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/use_cases/is_signed_in_use_case.dart';
import 'package:reco_genie_task/features/authentication_feature/domain_layer/use_cases/sign_in_use_case.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/sign_in_bloc/sign_in_bloc.dart';
import 'package:reco_genie_task/features/authentication_feature/presentaion_layer/controllers/user_bloc/user_bloc.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/data_source/remote/base_data_source/base_popular_remote_data_source.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/data_source/remote/base_data_source/base_service_remote_data_source.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/data_source/remote/base_data_source/base_slider_images_remote_data_source.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/data_source/remote/popular_remote_data_source.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/data_source/remote/service_remote_data_source.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/data_source/remote/slider_images_remote_data_source.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/reposities/service_repository.dart';
import 'package:reco_genie_task/features/home_feature/data_layer/reposities/slider_repository.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/reposities/base_service_repository.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/reposities/base_slider_repository.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/use_cases/get_services_use_case.dart';
import 'package:reco_genie_task/features/home_feature/domain_layer/use_cases/get_slider_images_use_case.dart';
import 'package:reco_genie_task/features/home_feature/presentation_layer/controllers/popular_bloc/popular_bloc.dart';
import 'package:reco_genie_task/features/home_feature/presentation_layer/controllers/slider_bloc/slider_bloc.dart';
import 'package:reco_genie_task/features/my_cart_feature/data_layer/data_source/base_data_source/base_cart_remote_data_source.dart';
import 'package:reco_genie_task/features/my_cart_feature/data_layer/data_source/cart_remote_data_source.dart';
import 'package:reco_genie_task/features/my_cart_feature/data_layer/reposities/cart_repository.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/add_product_to_cart_use_case.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/get_my_cart_products_use_case.dart';
import 'package:reco_genie_task/features/my_cart_feature/domain_layer/use_cases/remove_product_from_cart_use_case.dart';
import 'package:reco_genie_task/features/my_cart_feature/presentation_layer/controllers/cart_cubit/cart_cubit.dart';
import 'package:reco_genie_task/features/shopping_feature/data_layer/data_source/remote/base_data_source/base_products_remote_data_source.dart';
import 'package:reco_genie_task/features/shopping_feature/data_layer/data_source/remote/products_remote_data_source.dart';
import 'package:reco_genie_task/features/shopping_feature/data_layer/reposities/products_repository.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/reposities/base_product_repository.dart';
import 'package:reco_genie_task/features/shopping_feature/domain_layer/use_cases/get_all_products_use_case.dart';
import 'package:reco_genie_task/features/shopping_feature/presentation_layer/controllers/productCubit/product_cubit.dart';

import '../../features/authentication_feature/domain_layer/use_cases/get_local_user_use_case.dart';
import '../../features/authentication_feature/domain_layer/use_cases/sign_up_use_case.dart';
import '../../features/authentication_feature/domain_layer/use_cases/store_user_use_case.dart';
import '../../features/authentication_feature/presentaion_layer/controllers/sign_up_bloc/sign_up_bloc.dart';
import '../../features/home_feature/data_layer/reposities/popular_repository.dart';
import '../../features/home_feature/domain_layer/reposities/base_popular_repository.dart';
import '../../features/home_feature/domain_layer/use_cases/get_popular_use_case.dart';
import '../../features/home_feature/presentation_layer/controllers/service_bloc/service_bloc.dart';
import '../../features/my_cart_feature/domain_layer/reposities/base_cart_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    //cubits
    sl.registerFactory(() => ProductCubit(getAllProductsUseCase: sl()));
    sl.registerFactory(() => CartCubit(
        addProductToCartUseCase: sl(),
        getMyCartProductsUseCase: sl(),
        removeProductFromCartUseCase: sl()));

    //blocs
    sl.registerFactory(() => SignInBloc(signInUseCase: sl()));
    sl.registerFactory(() => SignUpBloc(signUpUseCase: sl()));
    sl.registerFactory(() => UserBloc(
        createUserUseCase: sl(),
        storeUserUseCase: sl(),
        getRemoteUserUseCase: sl(),
        getLocalUserUseCase: sl()));
    sl.registerFactory(() => ServiceBloc(getServicesUseCase: sl()));
    sl.registerFactory(() => PopularBloc(getPopularUseCase: sl()));
    sl.registerFactory(() => SliderBloc(getSliderImagesUseCase: sl()));

    //useCase
    sl.registerLazySingleton(
            () => SignInUseCase(baseAuthenticationRepository: sl()));
    sl.registerLazySingleton(
            () => SignUpUseCase(baseAuthenticationRepository: sl()));
    sl.registerLazySingleton(() => CreateUserUseCase(baseUserRepository: sl()));
    sl.registerLazySingleton(() => StoreUserUseCase(baseUserRepository: sl()));
    sl.registerLazySingleton(
            () => GetRemoteUserUseCase(baseUserRepository: sl()));
    sl.registerLazySingleton(
            () => GetLocalUserUseCase(baseUserRepository: sl()));
    sl.registerLazySingleton(
            () => IsSignedInUseCase(baseAuthenticationRepository: sl()));

    sl.registerLazySingleton(
        () => GetServicesUseCase(baseServiceRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularUseCase(basePopularRepository: sl()));
    sl.registerLazySingleton(
        () => GetSliderImagesUseCase(baseSliderRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllProductsUseCase(baseProductRepository: sl()));
    sl.registerLazySingleton(
        () => AddProductToCartUseCase(baseCartRepository: sl()));
    sl.registerLazySingleton(
        () => GetMyCartProductsUseCase(baseCartRepository: sl()));
    sl.registerLazySingleton(
        () => RemoveProductFromCartUseCase(baseCartRepository: sl()));

    //repositories
    sl.registerLazySingleton<BaseAuthenticationRepository>(() =>
        AuthenticationRepository(baseAuthenticationRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(
        baseUserRemoteDataSource: sl(), baseUserLocalDataSource: sl()));

    sl.registerLazySingleton<BaseServiceRepository>(
        () => ServiceRepository(baseServiceRemoteDataSource: sl()));
    sl.registerLazySingleton<BasePopularRepository>(
            () => PopularRepository(basePopularRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseSliderRepository>(
            () => SliderRepository(baseSliderImagesRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseProductRepository>(
            () => ProductsRepository(baseProductsRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseCartRepository>(
            () => CartRepository(baseCartRemoteDataSource: sl()));


    //data source
    sl.registerLazySingleton<BaseAuthenticationRemoteDataSource>(
            () => AuthenticationByFirebaseDataSource());
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
            () => UserFirebaseRemoteDataSource());
    sl.registerLazySingleton<BaseUserLocalDataSource>(
            () => UserHiveLocalDataSource());

    sl.registerLazySingleton<BaseServiceRemoteDataSource>(
            () => ServiceRemoteDataSource());
    sl.registerLazySingleton<BasePopularRemoteDataSource>(
            () => PopularRemoteDataSource());
    sl.registerLazySingleton<BaseSliderImagesRemoteDataSource>(
            () => SliderImagesRemoteDataSource());
    sl.registerLazySingleton<BaseProductsRemoteDataSource>(
            () => ProductsRemoteDataSource());
    sl.registerLazySingleton<BaseCartRemoteDataSource>(
            () => CartRemoteDataSource());
  }
}
