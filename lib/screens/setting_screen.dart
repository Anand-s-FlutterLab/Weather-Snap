import 'package:weather_snap/core/app_export.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              black,
              darkBlue,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                customText(
                  textAlign: TextAlign.center,
                  text: "Setting",
                  fontSize: 32,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget temp(
    {required String title, required String opt1, required String opt2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: Text(
                opt1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              // decoration: BoxDecoration(
              //     color: Colors.grey,
              //     borderRadius: BorderRadius.circular(8)),
              child: Text(
                opt2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
