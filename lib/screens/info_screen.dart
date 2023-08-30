import 'package:weather_snap/core/app_export.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
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
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(appIcon),
              const SizedBox(
                height: 20,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                text: "Weather Snap",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                text: "Version",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                text: "1.0",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                text: "Developed by",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                text: "Anand Patel",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                text: "Weather Information Provider",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              customText(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                text: "http://weatherapi.com/",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
