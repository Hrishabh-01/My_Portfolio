import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/certificate_util.dart';
import 'package:my_portfolio/widgets/certificate_card.dart';

class Certificate_Section extends StatelessWidget {
  const Certificate_Section({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context).size.width;
    return  Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child:  Column(
        children: [
          //certificate  title
          Container(
            width:screenWidth,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white24, // Set background color of the box
              borderRadius: BorderRadius.circular(50), // Add border radius to the box
            ),
            padding: const EdgeInsets.all(20),
            child: Center(
              child: RichText(text: TextSpan(
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Preah',
                      fontSize: 20),
                  children: [
                    TextSpan(text: 'Certificates',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ]
              )),
            ),
          ),
          const SizedBox(height: 50,),
          //work project cards
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 950),
            child: Wrap(
                spacing: 55,
                runSpacing: 55,
                children: [
                  for(int i=0;i<workCertificateUtils.length;i++)
                    CertificateCardWidget(project: workCertificateUtils[i],)
                ]),
          ),
        ],
      ),
    );
  }
}