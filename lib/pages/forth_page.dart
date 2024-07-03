import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ForthPage extends StatefulWidget {
  const ForthPage({
    super.key,
  });

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  final Uri _uri = Uri(
    scheme: 'https',
    host: 'laravel-app-evt-hrm.apps.openshift.exvention.co.th',
    path: 'oauth/authorize',
    queryParameters: {
      'client_id': '9c509957-cae2-47e4-8e2c-ccff7d831986',
      'redirect_uri': 'coconut://callBackPage',
      'response_type': 'code',
      'scope': 'read_users',
      'state': 'something'
    },
  );

  Future<void> _launchUrl() async {
    if (!await launchUrl(_uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: MaterialButton(
        onPressed: _launchUrl,
        child: const Text('press'),
      ),
    ));
  }
}
