import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/text_styles.dart';
import '../../bloc/i_dice_bloc.dart';

class DiceScreen extends StatefulWidget {
  DiceScreen({
    Key key,
    this.title,
    this.bloc,
  }) : super(key: key);

  final String title;
  final IDiceBloc bloc;

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
      body: StreamBuilder(
        initialData: Constants.initialDiceValues,
        stream: widget.bloc.valuesStream,
        builder: (
          context,
          snapshot,
        ) {
          return GridView.count(
            crossAxisCount: Constants.gridCrossAxisCount,
            padding: EdgeInsets.all(
              Constants.gridPadding,
            ),
            mainAxisSpacing: Constants.gridMainAxisSpacing,
            crossAxisSpacing: Constants.gridCrossAxisSpacing,
            children: _createDiceContainer(
              snapshot,
            ),
          );
        },
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
          StreamBuilder(
            initialData: Constants.initialScore,
            stream: widget.bloc.scoreStream,
            builder: (
              context,
              snapshot,
            ) {
              return Text(
                snapshot.data,
                style: TextStyles.bottomNavigationScoreValueTextStyle,
              );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _createDiceContainer(AsyncSnapshot diceNumbers) {
    var diceList = diceNumbers.data.map<Widget>(
      (diceNumber) {
        return InkWell(
          onTap: () {
            widget.bloc.roll();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Constants.diceContainerBorderRadius,
              ),
              color: Colors.blueGrey.shade700,
            ),
            child: Image(
              image: AssetImage(
                '${Constants.diceContainerImageNameStart}' +
                    '$diceNumber' +
                    '${Constants.diceContainerImageNameEnd}',
              ),
            ),
          ),
        );
      },
    );
    return diceList.toList();
  }
}
