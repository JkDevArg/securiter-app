import 'package:flutter/material.dart';
import 'package:securiter/api/Api.dart';
import 'package:telephony/telephony.dart';

class SmsListener {
  final Telephony telephony = Telephony.instance;

  void startListening() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) async {
        final senderNumber = message.address ?? 'Escondido';
        final messageBody = message.body ?? '';

        // Calling method send api sms
        final numberPhone = await Api().verifiedPhone(senderNumber);
        print(numberPhone);
        // Validate if number is not spamming or bot or other cause.

        // End validation
        // Validate Body Message
        // Validate if exists malicious url on body message
        final urlBody = await Api().verifiedURL(messageBody);
        print(urlBody);
        // End validation
      },
      onBackgroundMessage: backgroundMessageHandler,
    );
  }
}

void backgroundMessageHandler(SmsMessage message) {
  // Processing SMS in the background
  // Send data to your API
  final senderNumber = message.address ?? 'Escondido';
  final messageBody = message.body ?? '';

  Api().verifiedPhone(senderNumber)?.then((numberPhone) {
    print(numberPhone);
    // Validate if number is not spamming or bot or other cause.

    // End validation
    // Validate Body Message
    // Validate if exists malicious URL on body message
    Api().verifiedURL(messageBody)?.then((urlBody) {
      print(urlBody);
      // End validation
    });
  });
}
