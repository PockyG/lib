import 'package:flutter/material.dart';
import '../styles/styles.dart' as styles;

class QuizSlider extends StatefulWidget {


    final Function(String val) onChangeEnd;

    final String title;
    final double sliderMin;
    final double sliderMax;
    final int sliderDivisions;
    //bool bugIsRunOnce = false;



  QuizSlider({this.title, this.onChangeEnd,this.sliderMin, this.sliderMax, this.sliderDivisions});

  
  @override
  _QuizSliderState createState() => _QuizSliderState();
}

class _QuizSliderState extends State<QuizSlider> {
  double sliderValue;

   @override
  void initState() {
    super.initState();
    sliderValue = (this.widget.sliderMax - this.widget.sliderMin)/2;

  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: new Card(
          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
          child: new ListTile(
              subtitle: new Slider(

                value: sliderValue,
                min: this.widget.sliderMin,
                max: this.widget.sliderMax,
                divisions: this.widget.sliderDivisions == null ? (this.widget.sliderMax - this.widget.sliderMin).toInt(): this.widget.sliderDivisions,
                activeColor: Colors.pink.shade200,
                inactiveColor: Colors.blue,
                label: sliderValue.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
                onChangeEnd: (value) {
                  //HACK
                  // if(this.widget.bugIsRunOnce == true){
                  //    this.widget.onChangeEnd(value.toStringAsFixed(0));
                  // print("finished");
                  // }
                  
                  // this.widget.bugIsRunOnce = !this.widget.bugIsRunOnce;
            this.widget.onChangeEnd(value.toStringAsFixed(0));  
                },
              ),
              title: new Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                this.widget.title,
                style: styles.styleAgeSlider(),
              )),
              ) ,
        ),
      ),
    );
  }
}
