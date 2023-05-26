import 'package:flutter/material.dart';
import 'package:moneyapp/transaction.dart';
import 'package:moneyapp/transactionScreen.dart';

Widget elevatedButton({text, Function? onpress, width, height}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      // backgroundColor: AppColors.orange,
    ),
    onPressed: () {
      onpress!();
    },
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget buildIconButton(
    {Color? iconColor,
    required IconData iconButton,
    String? buttonText,
    double? fontSizeText,
    double? fontSizeIcon,
    Function? callBackFunction}) {
  if (buttonText != '') {
    print('---> $buttonText');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: fontSizeIcon,
          icon: Icon(iconButton, color: iconColor),
          onPressed: () {
            callBackFunction!(buttonText);
          },
        ),
        Text(
          buttonText!,
          style: TextStyle(color: iconColor, fontSize: fontSizeText),
        ),
      ],
    );
  } else {
    return Column(
      children: [
        Icon(iconButton, color: iconColor, size: fontSizeIcon),
      ],
    );
  }
}

Widget cardItem({required Transaction transaction}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
    ),
    margin: EdgeInsets.all(8),
    elevation: 8,
    child: Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 128, 130, 132)),
                          ),
                          // color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${transaction.city}, ${transaction.date}',
                                      style:
                                          TextStyle(color: Colors.grey[500])),
                                ],
                              ),
                            ),
                            Text(transaction.status,
                                style: TextStyle(color: Colors.grey[500])),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transaction.user),
                          const SizedBox(height: 10),
                          Text(transaction.amont,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 0),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                if (transaction.icon == "check") {
                                  return const Icon(Icons.check_circle,
                                      color: Colors.green);
                                } else if (transaction.icon == "Autorenew") {
                                  return const Icon(Icons.autorenew,
                                      color: Colors.yellow);
                                } else {
                                  return const Icon(Icons.cancel,
                                      color: Colors.red);
                                }
                              })
                              //
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
