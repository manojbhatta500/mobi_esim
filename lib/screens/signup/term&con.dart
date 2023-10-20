import 'package:flutter/material.dart';

class TcScreen extends StatelessWidget {
  TcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.7 * height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () {
                    print('printed cancel button');
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('Cancel')),
              SizedBox(
                width: 0.15 * width,
              ),
              Text(
                'Terms and Conditions',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
          Divider(),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Prevent abuses',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text("""
    
A Terms & Conditions agreement will help you prevent abuses such as theft of your content,reverse-engineering of your app and spamming of your users. This is because your T&C will do two things. First, it’s where you list out what types of abuses you won’t accept. Secondly, it’s where you reserve your right to terminate or suspend users or accounts that engage in these abuses.
     """),
                    Text(
                      'Protect Content',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(""" 
    
As a business owner, you own the logo content, and design of your website or app. A Terms & Conditions agreement informs users of this fact and prevents them from misappropriating any of your content. You can also help protect your users’ content in the same way.
    """),
                    Text(
                      'Reserve Right To Terminate ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text("""
    
You can maintain full control over your website or app by including a clause in your T&C thatreserves your right to terminate accounts for any reason. Without this clause, you may face lawsuits if you shut down a user account, even with cause. This is because your T&C will do two things. First, it’s where you list out what types of abuses you won’t accept. Secondly, it’s where you eeserve your right to terminate or suspend users or accounts that engage in thesabuses.This is because your T&C will do two things. First, it’s where
    """)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/verify');
              },
              child: Center(
                child: Container(
                  height: 0.08 * height,
                  width: 0.95 * width,
                  child: Center(
                    child: Text(
                      'I accept the Term and Conditions',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
