import 'package:flutter/material.dart';
import '../../models/user.dart';
import 'circle_sending_progress.dart';

class SendingPage extends StatefulWidget {
  final User selectedUser;
  const SendingPage({required this.selectedUser, Key? key}) : super(key: key);

  @override
  _SendingPageState createState() => _SendingPageState();
}

class _SendingPageState extends State<SendingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation anim;
  late Animation animScale;
  late Animation animScale2;

  @override
  void initState() {
    print('init state executed');
    animController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animScale2 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animController, curve: Interval(0.9, 1)));
    animScale = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: animController, curve: Interval(0.6, 0.8)));
    anim = Tween<double>(begin: 0, end: 100).animate(
        CurvedAnimation(parent: animController, curve: Interval(0, 0.5)))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });

    animController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black26),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                foregroundPainter: CircleSendingProgress((anim.value)),
                child: Container(
                  width: 140,
                  height: 140,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //     color: Color(0xFFE4582E), width: 8),
                      color: Colors.transparent),
                  child: Stack(
                    children: [
                      Transform.scale(
                        scale: animScale2.value,
                        child: Icon(
                          Icons.check_rounded,
                          size: 100,
                          color: Color(0xFFE4582E),
                        ),
                      ),
                      Transform.scale(
                        scale: animScale.value,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      widget.selectedUser.imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sending to',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.selectedUser.name.replaceAll('\n', ' '),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
