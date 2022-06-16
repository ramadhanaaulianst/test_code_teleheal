import 'package:flutter/material.dart';
import 'package:teleheal_apps/component/text_status.dart';

class CardFieldItemStatus extends StatelessWidget {
  final String? contentData;
  const CardFieldItemStatus({
    Key? key,
    required this.contentData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text("Status Approval",
                  style: TextStyle(
                    color: Colors.black
                  ),
                  textAlign: TextAlign.left,
                )
              ),
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if(contentData.toString() == 'VER')...[
                const TextStatus(
                  label: "VERIFIED",
                  iconPath: "assets/icons/verify_icon.svg",
                ),
              ],
              if(contentData.toString() == 'PEN')...[
                const TextStatus(
                  label: "PENDING",
                  iconPath: "assets/icons/pending_icon.svg",
                ),
              ],
              if(contentData.toString() == 'REV')...[
                const TextStatus(
                  label: "REVISI",
                  iconPath: "assets/icons/revise_icon.svg",
                ),
              ],
              if(contentData.toString() == 'APP')...[
                const TextStatus(
                  label: "APPROVED",
                  iconPath: "assets/icons/verify_icon.svg",
                ),
              ],
              if(contentData.toString() == 'REJ')...[
                const TextStatus(
                  label: "REJECT",
                  iconPath: "assets/icons/reject_icon.svg",
                ),
              ],
            ],
          ),
        )
      ],
    );
  }
}