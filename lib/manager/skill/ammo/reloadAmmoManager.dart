import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getReloadNorm(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.sRecharge;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 4) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadN2GHTq(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.sRecharge;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 5) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadN3G2Elem(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.sRecharge;
  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 6) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadP2P3Sh3StkH2PElem(
    int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.stRecharge;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  }
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 7) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadStk2TrchLg2DemPier(
    int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = "";
  if (img) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  } else {
    vretour = AppLocalizations.of(context)!.abrStRecharge;
  }

  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.sRecharge;
  }
  if (lvl >= 6) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 8) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadStk3FrgDragAffli2(
    int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = "";
  if (img) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  } else {
    vretour = AppLocalizations.of(context)!.abrStRecharge;
  }

  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.sRecharge;
  }
  if (lvl >= 7) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 9) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadPerfoShrap2(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.sRecharge;
  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 6) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadFrag2PDrag(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = "";
  if (img) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  } else {
    vretour = AppLocalizations.of(context)!.abrStRecharge;
  }
  if (lvl >= 6) {
    vretour = AppLocalizations.of(context)!.sRecharge;
  }
  if (lvl >= 8) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  return vretour;
}

String getReloadToxiLetarg(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = "";
  if (img) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  } else {
    vretour = AppLocalizations.of(context)!.abrStRecharge;
  }
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.sRecharge;
  }
  if (lvl >= 5) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 7) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadParaSomm(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = "";
  if (img) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  } else {
    vretour = AppLocalizations.of(context)!.abrStRecharge;
  }
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.sRecharge;
  }
  if (lvl >= 6) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 8) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadGren3(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = "";
  if (img) {
    vretour = AppLocalizations.of(context)!.stRecharge;
  } else {
    vretour = AppLocalizations.of(context)!.abrStRecharge;
  }
  if (lvl >= 4) {
    vretour = AppLocalizations.of(context)!.sRecharge;
  }
  if (lvl >= 6) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 7) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}

String getReloadShrap1(int lvl, int t, BuildContext context, bool img) {
  lvl += t;
  String vretour = AppLocalizations.of(context)!.sRecharge;
  if (lvl >= 3) {
    vretour = AppLocalizations.of(context)!.fRecharge;
  }
  if (lvl >= 6) {
    if (img) {
      vretour = AppLocalizations.of(context)!.ftRecharge;
    } else {
      vretour = AppLocalizations.of(context)!.abrFtRecharge;
    }
  }
  return vretour;
}
