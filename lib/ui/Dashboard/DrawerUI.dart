import 'package:flutter/material.dart';

Column drawer(BuildContext context, currentPageIndex ,{required Function onClick}) { 
   return  Column(
          // Important: Remove any padding from the ListView.
                children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: ListView(
                      children: [
                            ListTile(
                              title: const Text('Home'),
                              selected: currentPageIndex == 0,
                              onTap: () {
                                 onClick(0);
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                                title: const Text('Notification'),
                                selected: currentPageIndex == 1,
                                onTap: () {
                                  onClick(1);
                                  Navigator.pop(context);
                                },
                              ),
                            ListTile(
                              title: const Text('Message'),
                              selected: currentPageIndex == 2,
                               onTap: () {
                               onClick(2);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                    child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
        );
        }