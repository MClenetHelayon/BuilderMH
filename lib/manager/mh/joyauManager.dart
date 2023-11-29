import 'package:builder_mhrs/manager/color/colorManager.dart';
import 'package:builder_mhrs/manager/img/imgManager.dart';
import 'package:builder_mhrs/manager/popupManager.dart';
import 'package:builder_mhrs/manager/text/color.dart';
import 'package:builder_mhrs/object/Joyau.dart';
import 'package:builder_mhrs/object/Stuff.dart';
import 'package:builder_mhrs/object/Talisman.dart';
import 'package:builder_mhrs/object/armor/Bras.dart';
import 'package:builder_mhrs/object/armor/Casque.dart';
import 'package:builder_mhrs/object/armor/Ceinture.dart';
import 'package:builder_mhrs/object/armor/Jambe.dart';
import 'package:builder_mhrs/object/armor/Plastron.dart';
import 'package:builder_mhrs/object/weapon/Arme.dart';
import 'package:flutter/material.dart';

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
      listJoyaux: Plastron.listJoyaux,
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
      Stuff.ljowel.isNotEmpty ? Stuff.ljowel[0] : Joyaux.getBase();

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
        backgroundColor: MaterialStateProperty.all<Color>(getPrimary()),
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
        widget.s.nbSavoirFaire = widget.s.getTalentValueById(125);
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

  Widget jowel(int leSlot, String nom) {
    String img = slot(leSlot);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(img, height: 22, width: 22),
      const SizedBox(width: 10),
      white(nom),
    ]);
  }
}
