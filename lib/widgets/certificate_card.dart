import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/utils/certificate_util.dart';
import 'dart:js' as js;

class CertificateCardWidget extends StatefulWidget {
  const CertificateCardWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  final CertificateUtils project;

  @override
  _CertificateCardWidgetState createState() => _CertificateCardWidgetState();
}

class _CertificateCardWidgetState extends State<CertificateCardWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovering = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _hovering ? Matrix4.diagonal3Values(1.1, 1.1, 1.0) : Matrix4.diagonal3Values(1.0, 1.0, 1.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 290,
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColor.bgLight2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.project.image,
                height: 140,
                width: 260,
                fit: BoxFit.cover,
              ),

              //title
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                child: Text(
                  widget.project.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),

              //subtitle
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Text(
                  widget.project.organization,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Text(
                  widget.project.date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CustomColor.whiteSecondary,
                  ),
                ),
              ),
              const Spacer(),
              //footer
              Container(
                color: CustomColor.bgLight1,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      "Available on:",
                      style: TextStyle(
                        color: CustomColor.yellowSecondary,
                        fontSize: 10,
                      ),
                    ),
                    const Spacer(),
                    if(widget.project.driveLink != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 6,),
                        child: InkWell(
                          onTap: (){
                            js.context.callMethod("open",[widget.project.driveLink!]);
                          },
                          child: Image.asset("assets/images/google-drive.png",width: 19,),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
