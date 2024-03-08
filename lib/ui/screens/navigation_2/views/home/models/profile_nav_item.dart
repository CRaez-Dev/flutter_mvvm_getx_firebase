class ProfileNavModel {
  final String name;
  final double bottomSpace;
  final void Function() onHandleNav;

  ProfileNavModel({
    required this.name,
    required this.bottomSpace,
    required this.onHandleNav,
  });
}
