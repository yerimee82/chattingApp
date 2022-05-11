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
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          //배경
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
                      text: TextSpan(
                          text: 'Welcome',
                          style: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.white),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? ' to Punky chat!' : ' back!',
                              style: const TextStyle(
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
                      isSignupScreen ? 'Signup to continue..' : 'Signin to continue..',
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
          //텍스트 폼 필드
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: 180,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.all(20.0),
              //흰 박스 창 만들기
              height: isSignupScreen ? 280.0 : 250.0,
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
                                color: Colors.blue.shade200,
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
                                color: Colors.blue.shade200,
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  if(isSignupScreen)
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //텍스트 필드가 선택되었을 때, 박스 아웃라인 유지
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                hintText: 'User name',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(
                                    10) //text필드 만들 때 사용하는 padding
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //텍스트 필드가 선택되었을 때, 박스 아웃라인 유지
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(
                                    10) //text필드 만들 때 사용하는 padding
                                ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //텍스트 필드가 선택되었을 때, 박스 아웃라인 유지
                                  borderSide:
                                      BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(
                                    10) //text필드 만들 때 사용하는 padding
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  if(!isSignupScreen)
                  Container(
                    margin: EdgeInsets.only(top:35),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //텍스트 필드가 선택되었을 때, 박스 아웃라인 유지
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                                ),
                                hintText: 'User name',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(
                                    10) //text필드 만들 때 사용하는 padding
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Palette.iconColor,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  //텍스트 필드가 선택되었을 때, 박스 아웃라인 유지
                                  borderSide:
                                  BorderSide(color: Palette.textColor1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Palette.textColor1),
                                contentPadding: EdgeInsets.all(
                                    10) //text필드 만들 때 사용하는 padding
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //전송버튼
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: isSignupScreen ? 420 : 390,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(15),
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade100,
                          Colors.blueGrey.shade100
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 4) //그림자 위치
                            )
                      ]),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //하단 구글 로그인
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? 'or Signup with' : 'or Signin with'),
                SizedBox(
                  height: 15,
                ),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: Colors.indigo[600]
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Google')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
