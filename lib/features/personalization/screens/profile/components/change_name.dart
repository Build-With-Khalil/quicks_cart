import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar/qc_app_bar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/user/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: QCAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(QCSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(
              'Use a real name for easy verification. This name will appear on several Pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: QCSizes.sm),

            /// Text Field and button
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    validator:
                        (value) =>
                            QCValidator.validateEmpty('First Name', value),
                    decoration: InputDecoration(
                      labelText: QCTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  SizedBox(height: QCSizes.sm),
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    validator:
                        (value) =>
                            QCValidator.validateEmpty('Last Name', value),
                    decoration: InputDecoration(
                      labelText: QCTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: QCSizes.md),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
