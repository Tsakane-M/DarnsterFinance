import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../core/animations/entrance_fader.dart';

class ArrowOnTop extends StatefulWidget {
  const ArrowOnTop({Key? key}) : super(key: key);

  @override
  ArrowOnTopState createState() => ArrowOnTopState();
}

class ArrowOnTopState extends State<ArrowOnTop> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: -7,
      child: EntranceFader(
        offset: const Offset(0, 20),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {},
                onHover: (bool isHovering) {
                  if (isHovering) {
                    setState(() => isHover = true);
                  } else {
                    setState(() => isHover = false);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    boxShadow: isHover
                        ? <BoxShadow>[
                            const BoxShadow(
                              blurRadius: 12.0,
                              offset: Offset(2.0, 3.0),
                            )
                          ]
                        : null,
                  ),
                  child: Icon(
                    Icons.arrow_drop_up_outlined,
                    size: 5.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
