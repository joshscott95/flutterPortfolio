import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';
import 'package:flutterportfolio/constants/drawer_constraints.dart';
import 'package:flutterportfolio/constants/sns_links.dart';
import 'package:flutterportfolio/widgets/custom_textfield.dart';
import 'package:url_launcher/url_launcher_string.dart';


class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: Color.fromRGBO(26, 31, 54, 1),
      child: Column(
        children: [
          // title
          Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 50),

          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= 600) {
                  return buildNameEmailFieldDesktop();
                } else {
                  return buildNameEmailFieldMobile();
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          // message
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextfield(
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),

          // send btn
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Get in touch"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.yellowPrimary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: LayoutBuilder(
              builder:(context, constraints) {
              if (constraints.maxWidth>=kMinDekstopWidth){
                return buildNameEmailFieldDesktop();
              }

              // else
              return buildNameEmailFieldMobile();
            },
            ),
          ),
          const SizedBox(height: 15),

          // SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                        if (await canLaunchUrlString(SnsLinks.github)) {
                          await launchUrlString(SnsLinks.github);
                        };
                },
                child: Image.asset(
                  "assets/github.png",
                  width: 28,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () async {
                        if (await canLaunchUrlString(SnsLinks.linkedin)) {
                          await launchUrlString(SnsLinks.linkedin);
                        };
                },
                child: Image.asset("assets/linkedin.png", width: 28),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextfield(
            hintText: "Your name",
          ),
        ),
        const SizedBox(width: 15),

        // email
        Flexible(
          child: CustomTextfield(
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // name
        CustomTextfield(
          hintText: "Your name",
        ),
        const SizedBox(height: 15),

        // email
        CustomTextfield(
          hintText: "Your email",
        ),
      ],
    );
  }
}
