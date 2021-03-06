import 'package:flutter/material.dart';
import 'package:sma/models/profile/stock_chart.dart';
import 'package:sma/models/profile/stock_quote.dart';

import 'package:sma/widgets/profile/widgets/price.dart';
import 'package:sma/widgets/profile/widgets/profile/profile_graph.dart';
import 'package:sma/widgets/profile/widgets/profile/profile_summary.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class Profile extends StatelessWidget {

  final bool isSaved;
  final Color color;
  final StockQuote stockQuote;
  final List<StockChart> stockChart;

  Profile({
    @required this.isSaved,
    @required this.color,
    @required this.stockQuote,
    @required this.stockChart,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 26, right: 26, top: 26),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(this.stockQuote.name, style: kProfileCompanyName),
                  flex: 8,
                ),
                Expanded(
                  child: Container(),
                  flex: 2,
                ),
              ],
            ),

            ProfilePrice(
              color: this.color,
              quote: this.stockQuote,
            ),

            Container(
              height: 250,
              padding: EdgeInsets.only(top: 26),
              child: SimpleTimeSeriesChart(
                chart: this.stockChart,
                color: this.color
              )
            ),

            StatisticsWidget(
              quote: stockQuote,
            )
          ],
        ),
      ],
    );
  }
}