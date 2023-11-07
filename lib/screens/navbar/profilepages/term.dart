import 'package:flutter/material.dart';

class Term extends StatelessWidget {
  Term({required this.get});

  final bool get;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff3b57a6),
                    )),
                SizedBox(
                  width: 0.20 * width,
                ),
                Text(
                  get ? 'Terms & Conditions' : 'About us',
                  style: TextStyle(fontSize: 20, color: Color(0xff3b57a6)),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'Prevent abuses',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                              """A Terms & Conditions agreement will help you prevent abuses such as theft of your content,reverse-engineering of your app and spamming of your users. This is because your T&C will do two things. First, it’s where you list out what types of abuses you won’t accept. Secondly, it’s where you reserve your right to terminate or suspend users or accounts that engage in these abuses."""),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'Protect Content',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                              """As a business owner, you own the logo content, and design of your website or app. A Terms & Conditions agreement informs users of this fact and prevents them from misappropriating any of your content. You can also help protect your users’ content in the same way."""),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              'Reserve Right To Terminate ',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                              """You can maintain full control over your website or app by including a clause in your T&C thatreserves your right to terminate accounts for any reason. Without this clause, you may face lawsuits if you shut down a user account, even with cause. This is because your T&C will do two things. First, it’s where you list out what types of abuses you won’t accept. Secondly, it’s where you eeserve your right to terminate or suspend users or accounts that engage in thesabuses.This is because your T&C will do two things. First, it’s where""")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
