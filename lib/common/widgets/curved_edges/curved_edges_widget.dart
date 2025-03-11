import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/curved_edges/curved_edges.dart';

class QCCurvedEdgeWidget extends StatelessWidget {
  const QCCurvedEdgeWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: QCCustomCurvedEdges(), child: child);
  }
}
