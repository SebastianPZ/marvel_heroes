import 'dart:ui';

enum Device { phone, tablet }

Device _device({required Size size}) {
  if (size.shortestSide < 600) return Device.phone;
  return Device.tablet;
}

double title1TextSize({required Size size}) {
  switch (_device(size: size)) {
    case Device.tablet:
      return 40;
    default:
      return 18;
  }
}

double title2TextSize({required Size size}) {
  switch (_device(size: size)) {
    case Device.tablet:
      return 40;
    default:
      return 20;
  }
}

double title3TextSize({required Size size}) {
  switch (_device(size: size)) {
    case Device.tablet:
      return 48;
    default:
      return 24;
  }
}

double bodyTextSize({required Size size}) {
  switch (_device(size: size)) {
    case Device.tablet:
      return 24;
    default:
      return 12;
  }
}