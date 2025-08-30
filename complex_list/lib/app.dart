import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complex_list/complex_list/view/complex_list_page.dart';
import 'package:flutter_complex_list/repository.dart';

class App extends MaterialApp {
  App({required Repository repository, super.key})
    : super(
        home: RepositoryProvider.value(
          value: repository,
          child: const ComplexListPage(),
        ),
      );
}