import 'package:weather_snap/core/app_export.dart';
import 'package:get/get.dart';
import 'package:weather_snap/providers/sidebar_provider.dart';

Widget buildSidebar(BuildContext context, int drawerSelectedIndex) {
  return Drawer(
    elevation: 10,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.blue.shade100,
            Colors.blueAccent.shade100,
          ],
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10)
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Image(
                    image: AssetImage(appIcon),
                    height: 75,
                    width: 75,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: customText(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    text: "Weather Snap",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          drawerListTile(
            context: context,
            drawerSelected: drawerSelectedIndex == 1,
            index: 1,
            selectedIcon: Icons.cloud,
            title: "Current Weather",
            unselectedIcon: Icons.cloud_outlined,
          ),
          drawerListTile(
            context: context,
            drawerSelected: drawerSelectedIndex == 2,
            index: 2,
            selectedIcon: Icons.wb_sunny,
            title: "Weather Forecast",
            unselectedIcon: Icons.wb_sunny_outlined,
          ),
          drawerListTile(
            context: context,
            drawerSelected: drawerSelectedIndex == 3,
            index: 3,
            selectedIcon: Icons.settings,
            title: "Setting",
            unselectedIcon: Icons.settings_outlined,
          ),
          drawerListTile(
            context: context,
            drawerSelected: drawerSelectedIndex == 4,
            index: 4,
            selectedIcon: Icons.feedback,
            title: "Feedback",
            unselectedIcon: Icons.feedback_outlined,
          ),
          drawerListTile(
            context: context,
            drawerSelected: drawerSelectedIndex == 5,
            index: 5,
            selectedIcon: Icons.info,
            title: "Info",
            unselectedIcon: Icons.info_outline,
          ),
        ],
      ),
    ),
  );
}

Widget drawerListTile({
  required bool drawerSelected,
  required IconData unselectedIcon,
  required IconData selectedIcon,
  required String title,
  required BuildContext context,
  required int index,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: drawerSelected ? Colors.blue.shade800 : Colors.transparent,
      ),
      child: ListTile(
        leading: drawerSelected
            ? Icon(
                selectedIcon,
                color: Colors.white,
              )
            : Icon(
                unselectedIcon,
                color: Colors.black,
              ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: customText(
            text: title,
            color: drawerSelected ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          Provider.of<SidebarProvider>(context, listen: false)
              .drawerSelectedIndex = index;
          if (index == 1) {
            Get.toNamed(AppRoutes.homeScreen);
          }
          if (index == 2) {
            Get.toNamed(AppRoutes.forecastScreen);
          }
          if (index == 3) {
            Get.toNamed(AppRoutes.settingScreen);
          }
          if (index == 5) {
            Get.toNamed(AppRoutes.infoScreen);
          }
        },
      ),
    ),
  );
}
