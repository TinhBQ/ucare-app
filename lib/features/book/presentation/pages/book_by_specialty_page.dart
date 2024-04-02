import 'package:flutter/material.dart';
import 'package:mobile_advanced_project_fe/core/common/widgets/widgets.dart';
import 'package:mobile_advanced_project_fe/features/book/presentation/widgets/widgets.dart';

class BookBySpecialtyPage extends StatefulWidget {
  const BookBySpecialtyPage({super.key});

  @override
  State<StatefulWidget> createState() => _BookBySpecialtyPageState();
}

class _BookBySpecialtyPageState extends State<BookBySpecialtyPage> {
  int _currentStep = 0;
  List<String> listTitleSteps = [
    'Chọn hồ sơ',
    'Chọn thông tin khám',
    'Xác nhận thông tin khám',
    'Thanh toán',
    'Phiếu khám bệnh',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: listTitleSteps[_currentStep],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MultiStepperWidget(
            currentStep: _currentStep,
          ),
          Flexible(
            child: Navigator(
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return ChooseProfileWidget(
                      onChoose: () {
                        setState(() {
                          _currentStep++;
                        });
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => ChooseInfoWidget(),
                              ),
                            )
                            .then((value) => {
                                  setState(() {
                                    _currentStep--;
                                  }),
                                });
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
