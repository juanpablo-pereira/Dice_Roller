import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/textStyles.dart';

class DiceScreen extends StatefulWidget {
  DiceScreen({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: GridView.count(
        crossAxisCount: Constants.gridCrossAxisCount,
        padding: EdgeInsets.all(
          Constants.gridPadding,
        ),
        mainAxisSpacing: Constants.gridMainAxisSpacing,
        crossAxisSpacing: Constants.gridCrossAxisSpacing,
        children: List.generate(
          Constants.diceAmount,
          (int index) {
            return _createDiceContainer(index + 1);
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          SizedBox(
            width: Constants.horizontalPaddingSmall,
          ),
          Text(
            'Tap on any dice to make it roll!',
            style: TextStyles.bottomNavigationLabelTextStyle,
          ),
          SizedBox(
            width: Constants.horizontalPaddingMedium,
          ),
          Text(
            'Score: ',
            style: TextStyles.bottomNavigationScoreLabelTextStyle,
          ),
          Text(
            '21',
            style: TextStyles.bottomNavigationScoreValueTextStyle,
          ),
        ],
      ),
    );
  }

  Widget _createDiceContainer(int diceNumber) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Constants.diceContainerBorderRadius,
        ),
        color: Colors.blueGrey.shade700,
      ),
      child: Image(
        image: AssetImage(
          'assets/face_$diceNumber.png',
        ),
      ),
    );
  }
}
