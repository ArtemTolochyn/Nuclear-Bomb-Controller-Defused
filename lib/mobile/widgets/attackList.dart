import 'package:flutter/material.dart';
import 'package:nbc/controller/attackController.dart';

class AttackList extends StatefulWidget {
  AttackController attackController;

  AttackList({super.key, required this.attackController});

  @override
  State<AttackList> createState() => _AttackListState();
}

class _AttackListState extends State<AttackList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: 80,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 90, 90, 0.1),
                borderRadius: BorderRadius.circular(15)
            ),
            child: const Text(
              "List",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 90, 90, 1),
              ),
            ),
          ),
        ),

        Container(
            width: double.maxFinite,
            height: widget.attackController.attacked.length > 4 ? 240 : widget.attackController.attacked.isNotEmpty ? (60 * widget.attackController.attacked.length).toDouble() : 60,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 90, 90, 0.1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for ( var i in widget.attackController.attacked ) SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(255, 90, 90, 0.1),
                          ),

                          child: Text(
                            i.type,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 90, 90, 1),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromRGBO(255, 90, 90, 0.1),
                          ),

                          child: Text(
                            i.ip,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(255, 90, 90, 1),
                            ),
                          ),
                        ),

                        ElevatedButton(
                            onPressed: () => {
                              setState(() {
                                widget.attackController.removeIP(i);
                              })
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(255, 90, 90, 1),
                              elevation: 0.0,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 60,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8)
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
      ],
    );
  }
}
