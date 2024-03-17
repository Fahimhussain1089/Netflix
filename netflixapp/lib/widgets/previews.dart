import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:netflixapp/models/content_model.dart';

class Preview extends StatelessWidget {

  final String title;
  final List<Content> contentList;
  const Preview({
    required this.title,
    required this.contentList,
    Key? key,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,

            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index){
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: ()=> print(content.name),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                           shape: BoxShape.circle,
                            border: Border.all(color: content.color ?? Colors.white, width: 4.0)

                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Colors.black87,
                                  Colors.black45,
                                  Colors.transparent,
                                ],
                              stops: [0,0.25,1],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                            ),
                            shape: BoxShape.circle,
                            border: Border.all(color: content.color ?? Colors.white, width: 4.0)

                        ),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          
                          child: SizedBox(
                            height: 60,
                            child: Image.asset(content.titleImageUrl!),
                          ),
                      ),

                    ],
                  ),
                );
              }
          ),
        )
      ],
    );
  }
}
