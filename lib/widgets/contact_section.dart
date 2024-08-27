import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterportfolio/constants/colors.dart';
import 'package:flutterportfolio/constants/sns_links.dart';
import 'package:flutterportfolio/widgets/custom_textfield.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:http/http.dart' as http;

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: const Color.fromRGBO(26, 31, 54, 1),
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

          // Name and Email fields (conditional rendering)
          ConstrainedBox(
            constraints: const BoxConstraints(
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
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextfield(
              controller: messageController,
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),

          // send btn
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final response = await sendEmail(
                        nameController.text,
                        emailController.text,
                        messageController.text,
                      );
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');

                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Email sent successfully!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Failed to send email. Please try again.')),
                        );
                      }
                    } catch (e) {
                      print('Error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Failed to send email. Please try again.')),
                      );
                    }
                  },
                  child: const Text("Get in touch"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.yellowPrimary,
                    foregroundColor: Colors.white,
                  ),
                )),
          ),

          const SizedBox(height: 30),

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
                  }
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
                  }
                },
                child: Image.asset("assets/linkedin.png", width: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<http.Response> sendEmail(String name, String email, String message) {
    final Uri url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    return http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'service_id': 'service_8r1dbcs', // Replace with your service ID
        'template_id': 'template_fmshbrl', // Replace with your template ID
        'user_id': 'Y-QYCXmGkBAU-ur5m', // Replace with your user ID
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_message': message,
        },
      }),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextfield(
            controller: nameController,
            hintText: "Your name",
          ),
        ),
        const SizedBox(width: 15),

        // email
        Flexible(
          child: CustomTextfield(
            controller: emailController,
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
          controller: nameController,
          hintText: "Your name",
        ),
        const SizedBox(height: 15),

        // email
        CustomTextfield(
          controller: emailController,
          hintText: "Your email",
        ),
      ],
    );
  }
}
