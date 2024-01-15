import 'package:nbc/state/attackState.dart';
import 'package:nbc/util/ddosTool.dart';

class AttackController
{
  AttackState attackState;

  AttackController({required this.attackState});

  List<DDosTool> attacked = [];

  void addIP(ip)
  {
    var now = DateTime.now();
    DDosTool ddosTool = DDosTool(ip: ip.toString(), time: "${now.hour}:${now.minute > 9 ? now.minute : "${now.minute}0"}", attackState: attackState);
    attacked.add(ddosTool);
    ddosTool.start();
  }

  void removeIP(DDosTool ip)
  {
    ip.close();
    attacked.remove(ip);
  }
}