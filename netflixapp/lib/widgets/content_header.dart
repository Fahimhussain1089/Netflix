import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixapp/models/content_model.dart';
import 'package:netflixapp/widgets/responsive.dart';
import 'package:netflixapp/widgets/vertical_icon_button.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({
    required this.featuredContent,
});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(featuredContent:featuredContent ),
    );

  }
}
//here is mobile
class _ContentHeaderMobile extends StatefulWidget {
 // const _ContentHeaderMobile({super.key});
  final Content featuredContent;
  const _ContentHeaderMobile({
    Key? key,
    required this.featuredContent,
}): super(key: key);

  @override
  State<_ContentHeaderMobile> createState() => _ContentHeaderMobileState();
}


class _ContentHeaderMobileState extends State<_ContentHeaderMobile> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.featuredContent.imageUrl),
                fit: BoxFit.cover,
              )
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black,Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            child: widget.featuredContent.titleImageUrl != null
                ? Image.asset(widget.featuredContent.titleImageUrl!)
                : const SizedBox(), // or provide a placeholder image/widget
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                    icon: Icons.add,
                    title: 'List',
                    onTap:() => print("My List")
                ),
                _PlayButton(),
                VerticalIconButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onTap:() => print("Info ")
                )
              ],
            ))
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget  {
  // const _ContentHeaderMobile({super.key});
  final Content featuredContent;
  const _ContentHeaderDesktop({
    Key? key,
    required this.featuredContent,
  }): super(key: key);

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {

  late VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.featuredContent.videoUrl!),)
      ..initialize().then((_) =>
        setState(() {}))
      ..setVolume(0)
      ..play();
  }




  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
      ? _videoController.pause()
      : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
               ? _videoController.value.aspectRatio
               : 2.344,
            child: _videoController.value.isInitialized
            ? VideoPlayer(_videoController)
            : Image.asset(widget.featuredContent.imageUrl,
                fit: BoxFit.cover,
            ),

          ),
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 3.345,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black,Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
              ),
            ),

          ),


          Positioned(
              left: 60.0,
              right: 60.0,
              bottom: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Image.asset(widget.featuredContent.titleImageUrl!,),
                  ),
                  const SizedBox(height: 15.0,),
                  Text(
                      widget.featuredContent.description!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2.0,4.0),
                            blurRadius: 8.0
                          )
                        ]
                      ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    children: [
                      _PlayButton(),
                      const SizedBox(width: 16.0,),
                      TextButton.icon(
                        onPressed: () => print('More Info'),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        icon: Icon(Icons.info_outline),
                        label: Padding(
                          padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                          child: Text(
                            'More Info',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      if(_videoController.value.isInitialized)
                        IconButton(
                          icon: Icon(
                            _isMuted
                                ?
                            Icons.volume_off
                                :
                            Icons.volume_up,
                          ),
                          color: Colors.white,
                          iconSize: 30.0,
                          onPressed: ()=> setState(() {
                            _isMuted
                                ? _videoController.setVolume(100)
                                : _videoController.setVolume(0);
                            _isMuted = _videoController.value.volume == 0;
                          }),
                        ),


                    ],
                  )


                ],
              ),

          ),
         //phele yuan tha

        ],
      ),
    );
  }
}




class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => print('Play'),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
        ),

      ),
      icon: const Icon(Icons.play_arrow, size: 30.0),
      label: const Text(
        'Play',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
