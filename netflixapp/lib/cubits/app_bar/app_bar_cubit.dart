
import 'package:flutter_bloc/flutter_bloc.dart';

// part ' app_bar_state.dart';

class AppBarCubit extends Cubit<double>{
  AppBarCubit() : super(0);
  void setOffset(double  offset) => emit(offset);
}