import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import 'story.dart';
import 'posting.dart';

class IkeStagram extends StatelessWidget {
  const IkeStagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        title: const Text('池stagram'),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Container(
                child: Story(),
              ),
              Container(
                child: Posting(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
