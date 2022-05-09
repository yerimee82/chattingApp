import 'package:chat_app/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/main_screen.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/chat-background.jpg'),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //텍스트에 굵기 효과를 다르게 주고 싶을 때
                    RichText(
                      text: const TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white),
                          children: [
                            TextSpan(
                              text: ' to Punky chat!',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Signup to continue..',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              padding: EdgeInsets.all(20.0),
              //흰 박스 창 만들기
              height: 280.0,
              width: MediaQuery.of(context).size.width - 40,
              //화면의 가로 크기 구하기 - 40
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0), //모서리 둥글기 정도
                boxShadow: [
                  BoxShadow(
                      //그림자 효과
                      color: Colors.black45.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5)
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (!isSignupScreen)
                              Container(
                                //네모 상자라고 생각하면 됨
                                margin: EdgeInsets.only(top: 3),
                                height: 2.5,
                                width: 55,
                                color: Colors.indigo[400],
                              )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignupScreen = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSignupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                //네모 상자라고 생각하면 됨
                                height: 2.5,
                                width: 55,
                                color: Colors.indigo[400],
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(35.0)
                                    ),
                                ),
                              focusedBorder:  OutlineInputBorder( //텍스트 필드가 선택되었을 때, 박스 아웃라인 유지
                                borderSide:
                                BorderSide(color: Palette.textColor1),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(35.0)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
