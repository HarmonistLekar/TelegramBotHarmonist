import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

void main() {
  var teledart = TeleDart(Telegram('1107242305:AAEyU5mTchOis5KaSpm3tI076pybP34JBSE'), Event());

  teledart.start().then((me) => print('${me.username} is initialised'));

  teledart
        .onCommand('Привет')
        .listen(((message) => teledart.replyMessage(message, 'world')));
  
  teledart
      .onMessage(keyword: 'Привет')
     // .where((message) => message.text.contains('telegram'))
      .listen((message) => teledart.replyPhoto(
          message,
          //  io.File('example/dash_paper_plane.png'),
          'https://raw.githubusercontent.com/DinoLeung/TeleDart/master/example/dash_paper_plane.png',
          caption: 'Здраствуй!'));
}