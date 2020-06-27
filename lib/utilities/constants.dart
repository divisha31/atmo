import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Holtwood One SC',
  fontSize: 90.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Holtwood One SC',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Holtwood One SC',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputDecoration = InputDecoration(
                    filled :true,
                    fillColor:Colors.white,
                    icon :Icon(
                      Icons.location_city,
                      color:Colors.white,
                    ),
                    hintText : 'Enter City Name',
                    hintStyle: TextStyle(
                      color:Colors.grey,
                    ),
                    border:OutlineInputBorder(
                      borderRadius : BorderRadius.all(
                        Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                    ),
                  );
