import 'package:cronodoro/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cronodoro/pages/internal_storage/counter/add_page.dart';
import 'package:cronodoro/pages/internal_storage/counter/counter_controller.dart';
import 'package:cronodoro/pages/internal_storage/counter/remove_page.dart';

class TimerPage extends GetView<CounterController> {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.grey,
        elevation: 0,
        title: Obx(
          () => DropdownButton<String>(
            value: controller.selectedValue.toString(),
            onChanged: (String? value) {
              controller.setDropDown(value);
            },
            items: controller.dropdownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value.toString(),
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        ),
        actions: [
          Icon(
            Icons.play_arrow_rounded,
            color: AppColors.secondary,
            size: 50,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "shared_preferences",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Increase"),
                  onPressed: () {
                    controller.setCategoryPage(true);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCounter(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Decrease"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemoveCounter(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
