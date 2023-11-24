
import 'package:bank_genie_task/data/auth/data_source/remote_src.dart';
import 'package:bank_genie_task/data/auth/repository/auth_repo_impl.dart';
import 'package:bank_genie_task/domain/auth/repository/auth_repo.dart';
import 'package:bank_genie_task/domain/auth/usecase/sign_in.dart';
import 'package:bank_genie_task/domain/auth/usecase/sign_out.dart';
import 'package:bank_genie_task/data/office/data_source/office_remote_src.dart';
import 'package:bank_genie_task/data/office/repository/office_repo_impl.dart';
import 'package:bank_genie_task/domain/office/repository/office_repo.dart';
import 'package:bank_genie_task/domain/office/usecase/get_office_list.dart';
import 'package:bank_genie_task/presentation/authentication/auth_bloc/auth_bloc.dart';
import 'package:bank_genie_task/presentation/office_list/office_cubit/office_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'injection_container_main.dart';
