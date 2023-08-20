import 'package:flutter/material.dart';
import 'package:project_neal/constant.dart';
import 'package:project_neal/widgets/extra/add.dart';

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32.0, // Adjust the radius as needed
                backgroundColor:
                    Colors.white, // Background color of the CircleAvatar
                foregroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(
                width: 6,
              ),
              // ----------------- Lian Mollick Text ------------------
              Column(
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(
                        color: kFontLightGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Lian Mollick',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  color: kButtonDarkBlue,
                  size: 32,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Add()));
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kButtonDarkBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
