import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mvvm/constatnts.dart';
import 'package:mvvm/data_helper/remote/dio_helper.dart';
import 'package:mvvm/model/movie_model.dart';

part 'movie_page_model_state.dart';

class MoviePageModelCubit extends Cubit<MoviePageModelState> {
  MoviePageModelCubit() : super(MoviePageModelInitial());

  late MovieModel model ;
  getMovies({@required text}){
    emit(MoviePageModelWait());
      DioHelper.getData(Method, {'apikey':'d2419ee7','t':text}).then((value){
        emit(MoviePageModelSuccess());
        model = MovieModel.fromJson(value.data);
        print(model.Title.toString());
      }).catchError((err){
        emit(MoviePageModelError(err.toString()));
      });
  }
}
