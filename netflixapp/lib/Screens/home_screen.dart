import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixapp/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflixapp/data/data.dart';
import 'package:netflixapp/widgets/custom_app_bar.dart';
import 'package:netflixapp/widgets/widget.dart';

class HomeScreen extends StatefulWidget {
//  const HomeScreen ({Key key}) : super(key: key);
  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 //  double _scrollOffset = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController()
      ..addListener(() {

      context.read()<AppBarCubit>().setOffset(_scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;


    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: ()=> print('Cast'),

      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width,50.0),
        child: BlocBuilder<AppBarCubit,double>(
           builder: (context, scrollOffset) {
            return CustomAppBar(scrollOffset: scrollOffset);
          }
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Preview(
                key:  PageStorageKey('previews'),
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key:  PageStorageKey('MyList'),
              title: 'My List',
              contentList: myList,
            ),
          ),SliverToBoxAdapter(
            child: ContentList(
              key:  PageStorageKey('Originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(

              child: ContentList(
                key:  PageStorageKey('Trending'),
                title: 'Trending',
                contentList: trending,
              ),
            ),
          )
        ],
      ),
    );
  }
}
