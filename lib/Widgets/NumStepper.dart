import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumStepper extends StatelessWidget {
  final double width;
  final totalSteps;
  final int curStep;
  final Color stepCompColor;
  final Color currentStepColor;
  final Color inactiveColor;
  final double lineWidth;

  const NumStepper({
    super.key,
    required this.width,
    this.totalSteps,
    required this.curStep,
    required this.stepCompColor,
    required this.currentStepColor,
    required this.inactiveColor,
    required this.lineWidth
  }):assert (curStep>0==true&&curStep<=totalSteps+1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24,top: 20,right: 24),
      width: this.width,
      child: Row(
        children: _steps(),
      ),
    );
  }

  List<Widget>_steps() {
    var list=<Widget>[];
    for(int i=0;i<totalSteps;i++){
      var circleColor=getCircleColor(i);
      var borderColor=getBorderColor(i);
      var lineColor=getLineColor(i);

      list.add(
        Container(
          width: 40.0,
          height: 40.0,
          child:getInnerElemetnOfStepper(i),
          decoration: new BoxDecoration(
            color: circleColor,
            borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
            border: new Border.all(
              color: borderColor,
              width: 2.0
            )
          ),
        )
      );
      if(i!=totalSteps-1){
        list.add(
          Expanded(child: Container(height: lineWidth,color: lineColor,))
        );
      }
    }
    return list;
  }

  Widget getInnerElemetnOfStepper(index) {
    if(index+1<curStep){
      return Icon(
        Icons.check,
        color: stepCompColor,
        size: 18.0,
      );
    }else if(index+1==curStep){
      return Center(
        child: Text(
          '$curStep',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22
          ),
        ),
      );}
      else
        return Center(
          child: Text(
            '${index+1}',
            style: TextStyle(
                color: inactiveColor,
                fontSize: 22
            ),
          ),
        );
    }

  getCircleColor(int i) {
    var color;
    if (i + 1 < curStep) {
      color = Colors.transparent;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = Colors.transparent;
    return color;
  }

  getBorderColor(int i) {
    var color;
    if (i + 1 < curStep) {
      color = stepCompColor;
    } else if (i + 1 == curStep)
      color = currentStepColor;
    else
      color = inactiveColor;

    return color;
  }

  getLineColor(int i) {
    var color =
    curStep > i + 1 ? Color.fromRGBO(76, 239, 19, 1) : Color.fromRGBO(188, 188, 188, 1);
    return color;
  }
  }


