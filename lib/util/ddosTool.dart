import 'dart:async';

import 'package:nbc/state/attackState.dart';
import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/status.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class DDosTool
{
  String ip;

  String time;

  AttackState attackState;

  DDosTool({required this.ip, required this.time, required this.attackState});

  bool status = false;

  late WebSocketChannel channel;

  late String type;

  Future<void> start()
  async {

    status = true;

    late final Uri wsUrl;

    if(attackState.attackType == AttackType.boosted)
      {
        type = "Boosted";
        wsUrl = Uri.parse('wss://127.0.0.1');
      }
    else
      {
        type = "Simple";
        wsUrl = Uri.parse('wss://127.0.0.1');
      }

    channel = WebSocketChannel.connect(wsUrl);

    await channel.ready;

    channel.stream.listen((message) async {
      print(message);

      if(message.toString().startsWith(r'0{"sid":'))
        {
          channel.sink.add("none");
        }

      if(message.toString().startsWith(r'40{"sid":'))
      {
        if(attackState.attackType == AttackType.boosted)
        {
          channel.sink.add(r'none');
        }
        else
        {
          channel.sink.add(r'none');
        }
      }
    });

    Timer.periodic(const Duration(seconds: 1), (Timer timer) => {
      if(!status)
        {
          timer.cancel(),
        },
      if(channel.closeCode != null && status)
        {
          timer.cancel(),
          start()
        }
    });

  }

  void close()
  {
    status = false;
    channel.sink.close();
  }
}