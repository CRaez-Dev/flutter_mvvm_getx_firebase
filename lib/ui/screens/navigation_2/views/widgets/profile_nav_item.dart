import 'package:flutter/material.dart';

typedef FutureCallback = Future<void> Function();

class ProfileNavItem extends StatelessWidget {
  final String name;
  final FutureCallback onHandlePressed;

  const ProfileNavItem({
    super.key,
    required this.name,
    required this.onHandlePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
            backgroundColor: const MaterialStatePropertyAll(
              Color(0xFFFAFAFA),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            )),
        onPressed: onHandlePressed.call,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF282828),
                ),
              ),
              const SizedBox(
                height: 24,
                width: 24,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Color(0xFFACACE5),
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
