import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isBallanceShow = false;
  bool _isAnimation = false;
  bool _isBallance = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Color(0xffE2136E),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            backgroundColor: Colors.green.shade50,
            radius: 22,
            child: Icon(
              Icons.person,
              size: 35,
              color: Color(0xffE2136E),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Md. Meraj ul islam",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () async {
                  _isAnimation = true;
                  _isBallance = false;
                  setState(() {});

                  await Future.delayed(Duration(milliseconds: 500),
                      () => setState(() => _isBallanceShow = true));
                  await Future.delayed(Duration(seconds: 3),
                      () => setState(() => _isBallanceShow = false));
                  await Future.delayed(Duration(milliseconds: 200),
                      () => setState(() => _isAnimation = false));
                  await Future.delayed(Duration(milliseconds: 500),
                      () => setState(() => _isBallance = true));
                },
                child: Container(
                  height: 30,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: _isBallanceShow ? 1 : 0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          "৳ 1000.00",
                          style:
                              TextStyle(color: Color(0xffE2136E), fontSize: 14),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: _isBallance ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        child: Text(
                          "ব্যালেন্স দেখুন",
                          style:
                              TextStyle(color: Color(0xffE2136E), fontSize: 14),
                        ),
                      ),
                      AnimatedPositioned(
                        child: Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xffE2136E),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "৳",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        duration: Duration(milliseconds: 1100),
                        left: _isAnimation == false ? 5 : 135,
                        curve: Curves.fastOutSlowIn,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 45,
                child: Image.asset(
                  "assets/trophy.png",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 45,
                child: Image.asset(
                  "assets/bKash.png",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
