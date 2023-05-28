part of 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {
    getUsers();
  }
  UserService userService = UserService();
  Future<void> getUsers() async {
    emit(HomeLoadingState());
    await userService.getUser().then((dynamic response) => {
          if (response is List<UserModel>)
            {
              emit(HomeCompleteState(response))
              }
          else{
            emit(HomeErrorState(response))
            }
        });
  }
}
