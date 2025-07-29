import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

class URLLaunchHelper {
  static void downloadResumeFromAssets() {
    const assetUrl = 'assets/pdfs/MuhammadSohaibSana_Software_Resume.pdf';

    final anchor = web.HTMLAnchorElement()
      ..href = assetUrl
      ..download = 'Muhammad_Sohaib_Sana_Resume.pdf'
      ..style.display = 'none';

    web.document.body!.append(anchor);
    anchor.click();
    anchor.remove();
  }

  static void onTapEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dev.sohaibsana@gmail.com',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email client';
    }
  }

  static void onTapLinkedIn() async {
    final Uri linkedInUri =
        Uri.parse('https://www.linkedin.com/in/muhammad-sohaib-sana-531178284');
    if (await canLaunchUrl(linkedInUri)) {
      await launchUrl(linkedInUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch LinkedIn';
    }
  }

  static void onTapGitHub() async {
    final Uri githubUri = Uri.parse('https://github.com/Sohaib-Sana');
    if (await canLaunchUrl(githubUri)) {
      await launchUrl(githubUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch GitHub';
    }
  }

  static void onTapWhatsApp() async {
    const phoneNumber = '+923105100696'; // include country code
    final Uri whatsappUri =
        Uri.parse('https://wa.me/${phoneNumber.replaceAll('+', '')}');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open WhatsApp chat';
    }
  }

  static void onSayHelloTap() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dev.sohaibsana@gmail.com',
      query:
          'subject=Let\'s Create Something Amazing!&body=Hi Sohaib,', // optional
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email client';
    }
  }
}
