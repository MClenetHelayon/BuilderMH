import 'package:flutter/material.dart';
import '../object/Arme.dart';
import '../object/Armure.dart';
import '../object/Joyau.dart';
import '../object/Stuff.dart';
import '../object/Talisman.dart';
import 'popupManager.dart';
import 'textManager.dart';

Widget joyauArme(int slot, int numJoyau, Stuff s, Function() onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Arme.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

Widget joyauCasque(int slot, int numJoyau, Stuff s, VoidCallback onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Casque.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

Widget joyauPlastron(int slot, int numJoyau, Stuff s, VoidCallback onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Casque.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

Widget joyauBras(int slot, int numJoyau, Stuff s, VoidCallback onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Bras.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

Widget joyauCeinture(int slot, int numJoyau, Stuff s, VoidCallback onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Ceinture.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

Widget joyauJambiere(int slot, int numJoyau, Stuff s, VoidCallback onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Jambiere.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

Widget joyauTalisman(int slot, int numJoyau, Stuff s, VoidCallback onUpdate) {
  return JoyauWidget(
      slot: slot,
      numJoyau: numJoyau,
      listJoyaux: Talisman.listJoyaux,
      s: s,
      onUpdate: onUpdate);
}

class JoyauWidget extends StatefulWidget {
  final int slot;
  final int numJoyau;
  final List<Joyaux> listJoyaux;
  final Stuff s;
  final VoidCallback onUpdate;

  JoyauWidget(
      {required this.slot,
      required this.numJoyau,
      required this.listJoyaux,
      required this.s,
      required this.onUpdate});

  @override
  _JoyauWidgetState createState() => _JoyauWidgetState();
}

class _JoyauWidgetState extends State<JoyauWidget> {
  Joyaux joyauValue =
      Stuff.ljowel.length != 0 ? Stuff.ljowel[0] : Joyaux.getBase();

  void updateListJoyaux(Function(List<Joyaux>) action) {
    setState(() {
      action(widget.listJoyaux);
    });
    widget.onUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      onPressed: () async {
        var value = await joyau(context, widget.slot);
        if (value == null) return;

        if (value.id == 0) {
          updateListJoyaux((list) {
            joyauValue = Stuff.ljowel[0];
            list.remove(list[widget.numJoyau]);
          });
        } else {
          updateListJoyaux((list) {
            joyauValue = value;
            list.add(joyauValue);
          });
        }
        widget.s.nbSavoirFaire = widget.s.getTalentById(125);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          jowel(
              widget.slot,
              joyauValue.id != 0 && joyauValue.id != 9999
                  ? "${joyauValue.name} +${joyauValue.level}[${joyauValue.slot}]"
                  : joyauValue.name),
        ],
      ),
    );
  }
}
