import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbc/main.dart';
import 'package:nbc/state/attackState.dart';

class AttackSelector extends StatefulWidget {

  AttackState attackState;

  AttackSelector({super.key, required this.attackState});

  @override
  State<AttackSelector> createState() => _AttackSelectorState();
}

class _AttackSelectorState extends State<AttackSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () => {
              setState(() {
                widget.attackState.attackType = AttackType.boosted;
              })
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.attackState.attackType == AttackType.boosted ? const Color.fromRGBO(255, 90, 90, 1) : const Color.fromRGBO(255, 90, 90, 0.5),
              elevation: 0.0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 65,
              child: const Text(
                "Boosted",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            )
        ),

        const SizedBox(
          width: 10,
        ),

        ElevatedButton(
            onPressed: () => {
              setState(() {
                widget.attackState.attackType = AttackType.simple;
              })
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.attackState.attackType == AttackType.simple ? const Color.fromRGBO(255, 90, 90, 1) : const Color.fromRGBO(255, 90, 90, 0.5),
              elevation: 0.0,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 65,
              child: const Text(
                "Simple",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            )
        ),
      ],
    );
  }
}
