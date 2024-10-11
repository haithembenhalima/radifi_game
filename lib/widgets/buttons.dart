import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Text(
        '${title}',
        style: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      label: Icon(
        Icons.play_arrow_rounded,
        size: 45,
        color: Colors.black,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 235, 236, 236),
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 80, left: 80),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          // Change your radius here
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
    );
  }
}



// ***************************************




class sectionButton extends StatelessWidget {
  const sectionButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isDisable,
  });
  final String title;
  final void Function() onPressed;
  final bool isDisable;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isDisable == false ? onPressed : null,
      icon: Text(
        '${title}',
        style: TextStyle(
            color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(35),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: Color.fromARGB(255, 235, 236, 236),
        disabledBackgroundColor: Color.fromARGB(255, 95, 95, 95),
      ),
      label: Icon(
        Icons.star,
        color: Color.fromARGB(255, 177, 146, 8),
        size: 35,
      ),
    );
  }
}


// ******************************



class LettersButton extends StatelessWidget {
  const LettersButton({
    super.key, required this.title, required this.onPressed,
  });
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:2.0,left: 2),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text("${title}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
        style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 214, 241, 138))
      ),
    );
  }
}
