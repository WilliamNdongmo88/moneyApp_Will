import 'package:flutter/material.dart';
import 'package:moneyapp/transactionListScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black54),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TransactionListScreen()));
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 0),
            ),
            Text(
              "Mon profil",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            CircleAvatar(
              radius: 90.0,
              backgroundImage: AssetImage('images/moi.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}


