import 'package:mvc_multi_screens/src/features/club_info/model/club_info_model.dart';

class ClubInfoState {
  final ClubInfoModel clubInfo;
  final bool isLoading;

  ClubInfoState({required this.clubInfo, this.isLoading = false});

  ClubInfoState.initial() : clubInfo = ClubInfoModel.empty(), isLoading = false;

  ClubInfoState copyWith({ClubInfoModel? clubInfo, bool? isLoading}) {
    return ClubInfoState(
      clubInfo: clubInfo ?? this.clubInfo,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
