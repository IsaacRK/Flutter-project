import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vanilla/model/banner/banner_response.dart';
import 'package:vanilla/repository/banner/banner_repository.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;

  BannerBloc({required this.bannerRepository}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerListEvent) {
        emit(BannerLoading());

        final data = await bannerRepository.getBannerList();

        emit(BannerSuccess(bannerList: data));
      }
    });
  }
}
