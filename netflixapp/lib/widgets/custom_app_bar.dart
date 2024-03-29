

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflixapp/assets.dart';
import 'package:netflixapp/widgets/responsive.dart';


class CustomAppBar extends StatelessWidget {

  final double scrollOffset;
  const CustomAppBar({

    required this.scrollOffset ,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 24.0),
      color: Colors.red.withOpacity((scrollOffset / 350).clamp(0,1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),

      )
    );
  }
}
//here is the methode of _CustomAppBarDesktop()
class _CustomAppBarMobile extends StatelessWidget {
 // const _CustomAppBarMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    title: 'TV Shows',
                    onTap: () => print('TV Shows')
                ),
                _AppBarButton(
                    title: 'Movies',
                    onTap: () => print('Movies')
                ),
                _AppBarButton(
                    title: 'My List',
                    onTap: () => print('My List')
                ),



              ],),
          )
        ],
      ),
    );
  }
}

//here is the methode of _customAppBarMobile()
class _CustomAppBarDesktop extends StatelessWidget {
 // const _CustomAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                title: 'Home',
                onTap: () => print('Home')
            ),
                _AppBarButton(
                    title: 'TV Shows',
                    onTap: () => print('TV Shows')
                ),
                _AppBarButton(
                    title: 'Movies',
                    onTap: () => print('Movies')
                ),
                _AppBarButton(
                    title: 'Latest',
                    onTap: () => print('Latest')
                ),
                _AppBarButton(
                    title: 'My List',
                    onTap: () => print('My List')
                ),



              ],),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.search_rounded),
                     iconSize: 28.0,
                     color: Colors.white,
                     onPressed: () => print('Search'),
                ),
                _AppBarButton(
                    title: 'KIDS',
                    onTap: () => print('KIDS')
                ),
                _AppBarButton(
                    title: 'DVD',
                    onTap: () => print('DVD')
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Gift'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),



              ],),
          )
        ],
      ),
    );
  }
}







class _AppBarButton extends StatelessWidget {

  final String title;
  final void Function()? onTap;


   const _AppBarButton({

    required this.title,
     this.onTap,
}); //super (key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
