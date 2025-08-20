// import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
// import 'dart:ui' show ImageFilter;

// abstract class PlatformTooltipShape extends ShapeBorder {
//   const PlatformTooltipShape({
//     this.borderColor = Colors.black12,
//     this.borderWidth = 0.5,
//   });

//   final Color borderColor;
//   final double borderWidth;

//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderWidth);

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     final paint =
//         Paint()
//           ..color = borderColor
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = borderWidth;
//     canvas.drawPath(getOuterPath(rect), paint);
//   }

//   @override
//   ShapeBorder scale(double t) => this;
// }

// class IOSTooltipShape extends PlatformTooltipShape {
//   const IOSTooltipShape({
//     super.borderColor = Colors.black12,
//     super.borderWidth = 0.5,
//   });

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return Path()
//       ..addRRect(BorderRadius.circular(8).toRRect(rect).deflate(borderWidth));
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final Path path = Path();
//     final double width = rect.width;
//     final double height = rect.height;
//     const double radius = 8.0;

//     path.moveTo(radius, 0);
//     path.lineTo(width - radius, 0);
//     path.quadraticBezierTo(width, 0, width, radius);
//     path.lineTo(width, height - radius);
//     path.quadraticBezierTo(width, height, width - radius, height);
//     path.lineTo(radius, height);
//     path.quadraticBezierTo(0, height, 0, height - radius);
//     path.lineTo(0, radius);
//     path.quadraticBezierTo(0, 0, radius, 0);
//     path.close();
//     return path;
//   }
// }

// class AndroidTooltipShape extends PlatformTooltipShape {
//   const AndroidTooltipShape({
//     super.borderColor = Colors.black12,
//     super.borderWidth = 0.5,
//   });

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return Path()
//       ..addRRect(BorderRadius.circular(4).toRRect(rect).deflate(borderWidth));
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final Path path = Path();
//     final double width = rect.width;
//     final double height = rect.height;
//     const double radius = 4.0;

//     path.moveTo(radius, 0);
//     path.lineTo(width - radius, 0);
//     path.quadraticBezierTo(width, 0, width, radius);
//     path.lineTo(width, height - radius);
//     path.quadraticBezierTo(width, height, width - radius, height);
//     path.lineTo(radius, height);
//     path.quadraticBezierTo(0, height, 0, height - radius);
//     path.lineTo(0, radius);
//     path.quadraticBezierTo(0, 0, radius, 0);
//     path.close();
//     return path;
//   }
// }

// class PlatformTooltip extends StatelessWidget {
//   final Widget child;
//   final Color borderColor;
//   final double borderWidth;
//   final double blurStrength;
//   final Color glassColor;

//   const PlatformTooltip({
//     super.key,
//     required this.child,
//     this.borderColor = Colors.black12,
//     this.borderWidth = 0.5,
//     this.blurStrength = 3.0,
//     this.glassColor = const Color(0xCCFFFFFF),
//   });

//   @override
//   Widget build(BuildContext context) {
//     final shape =
//         Platform.isIOS
//             ? IOSTooltipShape(
//               borderColor: borderColor,
//               borderWidth: borderWidth,
//             )
//             : AndroidTooltipShape(
//               borderColor: borderColor,
//               borderWidth: borderWidth,
//             );

//     return ClipPath(
//       clipper: _ShapeClipper(shape),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
//         child: Container(
//           decoration: ShapeDecoration(color: glassColor, shape: shape),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

// class _ShapeClipper extends CustomClipper<Path> {
//   final ShapeBorder shape;

//   _ShapeClipper(this.shape);

//   @override
//   Path getClip(Size size) {
//     return shape.getOuterPath(Rect.fromLTWH(0, 0, size.width, size.height));
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }
