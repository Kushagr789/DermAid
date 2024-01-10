import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> pieChartSectionData = [
  PieChartSectionData(
    value: 60,
    title: '60%',
    radius: 10,
    showTitle: false,
    color: Color.fromRGBO(19, 35, 70,1),
  ),
  PieChartSectionData(
    value: 30,
    radius: 10,
    showTitle: false,
    color: Color.fromRGBO(74, 213, 205, 1),
  ),
  PieChartSectionData(
    radius: 10,
    value: 10,
    showTitle: false,
    color: Color.fromRGBO(119, 128, 137, 1),
  ),

];