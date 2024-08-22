import 'package:flutter/material.dart';

push(BuildContext context, Widget view) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => view));
}

pushReplacement(BuildContext context, Widget view) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => view));
}
