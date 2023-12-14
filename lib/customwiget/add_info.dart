import 'package:flutter/material.dart';

class AddInfo extends StatefulWidget {
  const AddInfo(
      {super.key,
      required this.network,
      required this.plan,
      required this.policy});
  final String network;
  final String plan;
  final String policy;

  @override
  State<AddInfo> createState() => _AddInfoState();
}

class _AddInfoState extends State<AddInfo> {
  String replaceDashWithSpace(String inputString) {
    return inputString.replaceAll('-', ' ');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.23 * height,
      width: 0.9 * width,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Color(0xff2941b8ea), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Icon(Icons.network_cell), Text('Network')],
              ),
              Row(
                children: [Text('${widget.network}')],
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Icon(Icons.check_box), Text('Plan Type')],
              ),
              Row(
                children: [Text(replaceDashWithSpace('${widget.plan}'))],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [Icon(Icons.policy), Text('Activation Policy')],
              ),
              Row(
                children: [
                  Text(replaceDashWithSpace('${widget.policy}')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
