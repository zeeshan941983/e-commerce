import 'package:amazon/features/Account/services/account_services.dart';
import 'package:amazon/features/Account/widgets/account_bottons.dart';
import 'package:flutter/material.dart';

class TopBottons extends StatelessWidget {
  const TopBottons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          AccountBotton(
            ontap: () {},
            text: "Your orders",
          ),
          AccountBotton(
            ontap: () {},
            text: "Turn Seller",
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountBotton(
              ontap: () => AccountServices().logOut(context),
              text: "Log Out",
            ),
            AccountBotton(
              ontap: () {},
              text: "Your Wish List",
            ),
          ],
        )
      ],
    );
  }
}
