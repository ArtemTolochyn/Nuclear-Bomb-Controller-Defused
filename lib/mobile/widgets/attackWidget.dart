import 'package:flutter/material.dart';
import 'package:nbc/controller/attackController.dart';

class AttackWidget extends StatefulWidget {
  AttackController attackController;
  TextEditingController textEditingController;
  final VoidCallback update;

  AttackWidget({super.key, required this.attackController, required this.textEditingController, required this.update});

  @override
  State<AttackWidget> createState() => _AttackWidgetState();
}

class _AttackWidgetState extends State<AttackWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 90, 90, 0.1),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Text(
                  "IP",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 90, 90, 1)
                  ),
                ),
              ),

              SizedBox(
                  height: 50,
                  width: 240,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(255, 90, 90, 0.1)
                    ),
                    child: TextField(
                      controller: widget.textEditingController,
                      keyboardType: TextInputType.number,
                      cursorColor: const Color.fromRGBO(255, 90, 90, 0.5),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 90, 90, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: ElevatedButton(
              onPressed: () => {
                setState(() {
                  widget.attackController.addIP(widget.textEditingController.text);
                  widget.textEditingController.clear();
                  widget.update();
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
                width: 200,
                child: const Text(
                  "Attack",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              )
          ),
        )
      ],
    );
  }
}
