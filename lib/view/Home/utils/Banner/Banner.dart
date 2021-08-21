import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          height: 200,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 10,
                right: 0,
                child: Container(
                  height: 200,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 1.0),
                      itemCount: 5,
                      itemBuilder: (_, i) {
                        return Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/busBanner.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
