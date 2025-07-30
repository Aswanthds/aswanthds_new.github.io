import 'package:flutter/material.dart';

import 'package:portfolio/config/extensions.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  late GlobalKey<FormState> _formKey;
  // late TextEditingController _emailController;
  // late TextEditingController _messageController;
  // late TextEditingController _nameController;
  // late TextEditingController _subjectController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    // _emailController = TextEditingController();
    // _messageController = TextEditingController();
    // _nameController = TextEditingController();
    // _subjectController = TextEditingController();
  }

  @override
  void dispose() {
    // _emailController.dispose();
    // _messageController.dispose();
    // _nameController.dispose();
    // _subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getFormWidth(context.mediaQueryWidth),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CustomButton(
            //   label: 'Get in Touch',
            //   onPressed: () {
            //     //sendEmail();
            //   },
            //   backgroundColor: AppColors.primaryColor,
            //   width: _getFormWidth(context.mediaQueryWidth),
            // ),
          ],
        ),
      ),
    );
  }

  double _getFormWidth(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return deviceWidth;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return deviceWidth / 1.6;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return deviceWidth / 2;
    } else {
      return deviceWidth / 2.5;
    }
  }

  // Future<void> sendEmail() async {
  //   final smtpServer = SmtpServer('smtp.elasticemail.com',
  //       username: 'aswanthds', password: 'password');

  //   final message = Message()
  //     ..from =
  //         Address(_emailController.text.trim(), _nameController.text.trim())
  //     ..recipients.add('aswanthds2005@gmail.com')
  //     ..subject = 'Hello from ${_nameController.text}!'
  //     ..text = 'This is the plain text body of the email.'
  //     ..html = '<h1>HTML body of the email</h1>';

  //   try {
  //     final sendReport = await send(message, smtpServer);

  //     print('Message sent: ${sendReport.connectionOpened}');
  //   } catch (e) {
  //     print('Error occurred while sending email: $e');
  //   }
  // }
}
