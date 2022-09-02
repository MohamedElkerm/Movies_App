import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/view_model/movie_page_model/movie_page_model_cubit.dart';

import '../constatnts.dart';
import '../widgets/re_usable.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MoviePage(),
    );
  }
}

class MoviePage extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context)=>MoviePageModelCubit()..getMovies(text: 'dead') ,
      child: BlocConsumer<MoviePageModelCubit,MoviePageModelState>(
        listener: ( context, state) {},
        builder: ( context,  state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title:const Text('Movies App'),
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(75.0),
                child: Container(
                  color: MyColor,
                  height: 75.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField(
                      label: "Search",
                      controller: searchController,
                      prefix: Icons.search,
                      type: TextInputType.text,
                      onSubmit:(String text){
                        BlocProvider.of<MoviePageModelCubit>(context).getMovies(text: text);
                      } ,
                    ),
                  ),
                ),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColor,
              ),
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                // width: MediaQuery
                //     .of(context)
                //     .size
                //     .width * 0.8,
                // height: MediaQuery
                //     .of(context)
                //     .size
                //     .height * 1/5,
                child:ConditionalBuilder(
                    condition: state is MoviePageModelSuccess,
                    builder: (context){
                      return movieList(
                        title: BlocProvider.of<MoviePageModelCubit>(context).model.Title,
                        poster: BlocProvider.of<MoviePageModelCubit>(context).model.Poster,
                        released: BlocProvider.of<MoviePageModelCubit>(context).model.Released,
                      );
                    },
                    fallback:(context){
                      return const Center(child: CircularProgressIndicator());
                    } ,
                ) ,

              ),
            ),
          );
        },
      )
    );
  }
}


