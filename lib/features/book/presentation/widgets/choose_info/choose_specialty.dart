// import 'package:flutter/material.dart';
// import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
// import 'package:mobile_advanced_project_fe/core/items/items.dart';
// import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

// class ChooseSpecialtyWidget extends StatefulWidget {
//   const ChooseSpecialtyWidget({super.key});

//   @override
//   State<StatefulWidget> createState() => _ChooseSpecialtyWidgetState();
// }

// class _ChooseSpecialtyWidgetState extends State<ChooseSpecialtyWidget> {
//   final _searchController = TextEditingController();
//   List<SpecialtyItem> specialtyItems = [
//     SpecialtyItem(title: 'Bệnh lý cột sống', price: 150000),
//     SpecialtyItem(title: 'Dị ứng - miễn dịch lâm sàng lâm sàng', price: 150000),
//     SpecialtyItem(
//         title: 'Da liễu',
//         price: 150000,
//         description:
//             "Chỉ nhận người bệnh từ 3 tuổi Chỉ nhận người bệnh từ 3 tuổi"),
//   ];
//   // void _onChooseSpecialty() {
//   //   Navigator.of(context).push(
//   //     MaterialPageRoute(
//   //       // builder: (context) => ChooseDateMedicalWidget(),
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
//       appBar: const SubAppBarWidget(
//         title: 'Chọn chuyên khoa',
//       ),
//       body: Column(
//         children: [
//           CustomSearchBar(
//             controller: _searchController,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 8,
//               horizontal: 20,
//             ),
//             child: Divider(
//               thickness: 1,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           SpecialtyListCardWidget(
//             specialtyItems: specialtyItems,
//             onPressed: _onChooseSpecialty,
//           ),
//         ],
//       ),
//     );
//   }
// }
