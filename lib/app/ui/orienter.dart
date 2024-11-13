import 'dart:math';

import 'package:flutter/material.dart';

class Orienter {
  final BuildContext context;
  Orienter(this.context);

  bool get isTall {
    Size size = MediaQuery.of(context).size;
    bool ret = size.height > size.width;
    // Orientation orientation = MediaQuery.of(context).orientation;
    // return orientation == Orientation.portrait;
    return ret;
  }

  Axis get rowDirection {
    return isTall ? Axis.horizontal : Axis.vertical;
  }

  Axis get columnDirection {
    return isTall ? Axis.vertical : Axis.horizontal;
  }

  double get minor {
    Size size = MediaQuery.of(context).size;
    return min(size.width, size.height);
  }

  double get major {
    Size size = MediaQuery.of(context).size;
    return max(size.width, size.height);
  }
}
