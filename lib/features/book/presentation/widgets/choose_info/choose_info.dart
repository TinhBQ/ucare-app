import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/items/items.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class ChooseInfoWidget extends StatefulWidget {
  const ChooseInfoWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ChooseInfoWidgetState();
}

class _ChooseInfoWidgetState extends State<ChooseInfoWidget> {
  List<InfoMedicalItem> infoMedicalItems = [];
  bool? isChoseSpecilty =
      true; // null: không iconRight, false: icon right là arrow_left, true: icon checked
  bool? isChoseDate = false;
  bool? isChoseTime = false;
  bool? isChoseDoctor;
  @override
  void initState() {
    super.initState();
    infoMedicalItems = [
      InfoMedicalItem(
        title: 'Chuyên khoa',
        icon: Icons.local_hospital_outlined,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChooseSpecialtyWidget(),
            ),
          );
        },
        iconRight: isChoseSpecilty == null
            ? null
            : isChoseSpecilty == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
      InfoMedicalItem(
        title: 'Ngày khám',
        icon: Icons.date_range_outlined,
        onPressed: isChoseDate == null
            ? null
            : () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChooseDateMedicalWidget(),
                  ),
                );
              },
        iconRight: isChoseDate == null
            ? null
            : isChoseDate == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
      InfoMedicalItem(
        title: 'Giờ khám',
        icon: Icons.watch_later_outlined,
        onPressed: isChoseTime == null
            ? null
            : () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChooseTimeMedicalWidget(),
                  ),
                );
              },
        iconRight: isChoseTime == null
            ? null
            : isChoseTime == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
      InfoMedicalItem(
        title: 'Bác sĩ',
        icon: Icons.medical_services_outlined,
        iconRight: isChoseDoctor == null
            ? null
            : isChoseDoctor == false
                ? Icons.keyboard_arrow_right_outlined
                : Icons.check_circle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: const SubAppBarWidget(
        title: 'Chọn thông tin khám',
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: InfoMedicalsListCardWidget(
              listInfoMedicalItems: infoMedicalItems,
            ),
          ),
        ],
      ),
    );
  }
}
