import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moneyapp/profileScreen.dart';
import 'package:moneyapp/transaction.dart';
import 'Widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var txt = 'Details transactions';
  double fontSizeTextAcceuil = 12;
  double fontSizeTextTransfert = 12;
  double fontSizeTextDevises = 12;
  double fontSizeTextSettings = 12;
  double fontSizeTextCamera = 12;

  bool isSelectedAcceuil = false;
  bool isSelectedTransfert = false;
  bool isSelectedDevises = false;
  bool isSelectedSetting = false;
  bool isSelectedCamera = false;

  final List<Transaction> transactions = [
    Transaction("Terminé", "William Ndongmo", "check", "450.00 USD", "Yaoundé",
        "Lun06 mai2023"),
    Transaction("En cours", "Tcheuffa Evariste", "Autorenew", "750.00 USD",
        "Yaoundé", "Lun08 mai2023"),
    Transaction("Terminé", "William Ndongmo", "Cancel", "1350.00 USD",
        "Yaoundé", "Lun06 mai2023"),
    Transaction("Terminé", "Ndongmo Thierry", "check", "500.00 USD", "Yaoundé",
        "Lun08 mai2023"),
    // Transaction("Terminé", "William Ndongmo", "check", "450.00 USD", "Yaoundé",
    //     "Lun06 mai2023"),
    // Transaction("En cours", "Tcheuffa Evariste", "Autorenew", "750.00 USD",
    //     "Yaoundé", "Lun08 mai2023"),
    // Transaction("Terminé", "William Ndongmo", "Cancel", "1350.00 USD",
    //     "Yaoundé", "Lun06 mai2023"),
    // Transaction("Terminé", "Ndongmo Thierry", "check", "600.00 USD", "Yaoundé",
    //     "Lun08 mai2023"),
  ];

  void funChange(changetxt) {
    setState(() {
      txt = changetxt;
      if (txt == 'Acceuil') {
        isSelectedAcceuil = !isSelectedAcceuil;
        fontSizeTextAcceuil = 15;
        isSelectedTransfert = false;
        isSelectedDevises = false;
        isSelectedSetting = false;
        isSelectedCamera = false;
        fontSizeTextTransfert = 12;
        fontSizeTextDevises = 12;
        fontSizeTextSettings = 12;
        fontSizeTextCamera = 12;
      } else if (txt == 'Transfert') {
        isSelectedTransfert = !isSelectedTransfert;
        fontSizeTextTransfert = 15;
        isSelectedAcceuil = false;
        isSelectedDevises = false;
        isSelectedSetting = false;
        isSelectedCamera = false;
        fontSizeTextAcceuil = 12;
        fontSizeTextDevises = 12;
        fontSizeTextSettings = 12;
        fontSizeTextCamera = 12;
      } else if (txt == 'Devises') {
        isSelectedDevises = !isSelectedDevises;
        fontSizeTextDevises = 15;
        isSelectedAcceuil = false;
        isSelectedTransfert = false;
        isSelectedSetting = false;
        isSelectedCamera = false;
        fontSizeTextAcceuil = 12;
        fontSizeTextTransfert = 12;
        fontSizeTextSettings = 12;
        fontSizeTextCamera = 12;
      } else if (txt == 'Settings') {
        isSelectedSetting = !isSelectedSetting;
        fontSizeTextSettings = 15;
        isSelectedAcceuil = false;
        isSelectedTransfert = false;
        isSelectedDevises = false;
        isSelectedCamera = false;
        fontSizeTextAcceuil = 12;
        fontSizeTextTransfert = 12;
        fontSizeTextDevises = 12;
        fontSizeTextCamera = 12;
      } else if (txt == 'Camera') {
        isSelectedCamera = !isSelectedCamera;
        fontSizeTextCamera = 15;
        isSelectedAcceuil = false;
        isSelectedTransfert = false;
        isSelectedDevises = false;
        isSelectedSetting = false;
        fontSizeTextAcceuil = 12;
        fontSizeTextTransfert = 12;
        fontSizeTextDevises = 12;
        fontSizeTextSettings = 12;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 0),
            ),
            Text(
              "Bonjour,",
              style: TextStyle(
                  color: Color.fromARGB(255, 75, 67, 67), fontSize: 12),
            ),
            Text(
              "Lisa Camilla",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),

        // leading: GestureDetector(
        //   onTap: () {/* Write listener code here */},
        //   child: Icon(
        //     Icons.menu, // add custom icons also
        //   ),
        // ),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(Icons.more_vert),
          //     )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.notifications,
                    size: 26.0, color: Colors.black54),
              )),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                txt,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildIconButton(
                      iconColor: Color.fromRGBO(242, 78, 30, 1),
                      iconButton: Icons.settings,
                      buttonText: '',
                      // fontSizeIcon: 55,
                      callBackFunction: funChange),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        return Dismissible(
                            key: Key(transaction.user),
                            onDismissed: (direction) {
                              setState(() {
                                transactions.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "${transaction.user} supprimé")));
                            },
                            child: cardItem(transaction: transaction));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 208, 221, 232),
          // color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconButton(
              callBackFunction: funChange,
              iconButton: Icons.home,
              buttonText: 'Acceuil',
              iconColor: isSelectedAcceuil
                  ? Color.fromRGBO(242, 78, 30, 1)
                  : Color.fromRGBO(33, 31, 30, 1),
              fontSizeText: isSelectedAcceuil ? fontSizeTextAcceuil : 12,
              fontSizeIcon: 25,
            ),
            buildIconButton(
              callBackFunction: funChange,
              iconButton: Icons.currency_exchange,
              buttonText: 'Transfert',
              iconColor: isSelectedTransfert
                  ? Color.fromRGBO(242, 78, 30, 1)
                  : Color.fromRGBO(33, 31, 30, 1),
              fontSizeText: isSelectedTransfert ? fontSizeTextTransfert : 12,
              fontSizeIcon: 25,
            ),
            buildIconButton(
              callBackFunction: funChange,
              iconButton: Icons.currency_franc,
              buttonText: 'Devises',
              iconColor: isSelectedDevises
                  ? Color.fromRGBO(242, 78, 30, 1)
                  : Color.fromRGBO(33, 31, 30, 1),
              fontSizeText: isSelectedDevises ? fontSizeTextDevises : 12,
              fontSizeIcon: 25,
            ),
            buildIconButton(
              callBackFunction: funChange,
              iconButton: Icons.settings,
              buttonText: 'Settings',
              iconColor: isSelectedSetting
                  ? Color.fromRGBO(242, 78, 30, 1)
                  : Color.fromRGBO(33, 31, 30, 1),
              fontSizeText: isSelectedSetting ? fontSizeTextSettings : 12,
              fontSizeIcon: 25,
            ),
            buildIconButton(
              callBackFunction: funChange,
              iconButton: Icons.camera,
              buttonText: 'Camera',
              iconColor: isSelectedCamera
                  ? Color.fromRGBO(242, 78, 30, 1)
                  : Color.fromRGBO(33, 31, 30, 1),
              fontSizeText: isSelectedTransfert ? fontSizeTextCamera : 12,
              fontSizeIcon: 25,
            ),
          ],
        ),
      ),
    );
  }
}
