import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xfffe987b),
                            Color(0xccfe987b),
                            Color(0x99fe987b),
                            Color(0x66fe987b),

                          ])),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up !",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Name(),
                        SizedBox(
                          height: 10,
                        ),
                        Email(),
                        SizedBox(
                          height: 10,
                        ),
                        Contact(),
                        SizedBox(
                          height: 10,
                        ),
                        Password(),
                        SizedBox(
                          height: 20,
                        ),
                        Signupbtn(),


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
  Widget Name() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.account_box_rounded,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Name',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Email',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }
  Widget Contact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.call,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Contact',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xfffe987b),
                ),
                hintText: 'Password',
                helperStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget Signupbtn() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      height: 40,
      child: InkWell(
        onTap: () {},
        child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xfffe987b),
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }


}
