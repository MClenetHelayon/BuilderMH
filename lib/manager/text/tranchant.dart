import 'package:builder_mhrs/manager/statManager.dart';
import 'package:builder_mhrs/object/Stuff.dart';

String listTranchant(Stuff s) {
  List<int> allSharp = allIntSharp(s);
  return "${allSharp[0]}/${allSharp[1]}/${allSharp[2]}/${allSharp[3]}/${allSharp[4]}/${allSharp[5]}/${allSharp[6]}";
}
