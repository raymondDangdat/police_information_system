import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset('assets/images/loading.gif', width: 100, height: 100, fit: BoxFit.fill,),
      ),
    );
  }
}
