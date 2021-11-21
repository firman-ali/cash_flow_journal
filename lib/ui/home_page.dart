import 'dart:ui';

import 'package:cash_flow_journal/constant/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1636471963387-56059f09f990?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=435&q=80',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Jimmy Timmy',
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.history),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Cash Flow Statistic',
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 12.0),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: size.width * 0.3,
                                  height: size.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Resume: ',
                                    style: TextStyle(
                                        fontSize: size.width * 0.05,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Expense',
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          ': Rp 777.000',
                                          style: TextStyle(
                                              fontSize: size.width * 0.035,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Income',
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          ': Rp 777.000',
                                          style: TextStyle(
                                              fontSize: size.width * 0.035,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Surplus',
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          ': Rp 777.000',
                                          style: TextStyle(
                                              fontSize: size.width * 0.035,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Cash Flow Data',
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                                onPressed: () {}, child: Icon(Icons.add)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Data'),
                        ),
                      ),
                    ),
                    childCount: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
