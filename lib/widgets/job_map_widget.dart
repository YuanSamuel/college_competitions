import 'package:college_competitions/utils/style_constants.dart';
import 'package:flutter/material.dart';

class JobMapWidget extends StatelessWidget {
  const JobMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = StyleConstants.height;
    double width = StyleConstants.width;

    return Container(
      width: width * 0.8,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.24,
              width: width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'February 18th, 2022',
                              style: StyleConstants.subTextReg,
                            ),
                            Text(
                              '6:30 PM',
                              style: StyleConstants.subTextReg,
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "Furniture Moving",
                          style: StyleConstants.titleTextBold,
                        ),
                        SizedBox(
                          width: width * 0.025,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 15.0),
                        Text(
                          " Jester East",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: StyleConstants.subTextReg,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: width * 0.04,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                height: width * 0.2,
                width: width * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                // child: CachedNetworkImage(
                //   imageUrl: currentScan.pet.image != null &&
                //       currentScan.pet.image.isNotEmpty
                //       ? currentScan.pet.image
                //       : StyleConstants.defaultPetImageUrl,
                child: Image(
                  image: AssetImage('assets/profpic1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
