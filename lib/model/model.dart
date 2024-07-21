class CalcuatorButton {
  final String title;
  final String image;
  final void Function() onPress;

  CalcuatorButton({
    required this.title,
    required this.image,
    required this.onPress,
  });
}