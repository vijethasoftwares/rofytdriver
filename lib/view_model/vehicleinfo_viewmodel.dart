// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, file_names, prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:myride/model/vehicleinfo.dart';
import 'package:myride/repository/vehicleinfo_repo.dart';
import 'package:myride/view/for_driver/submit/submit.dart';

class VehicleInfoViewModel extends ChangeNotifier {
  final _vehicleInfoRepo = VehicleInfoRepo();

  bool loading = false;

  List<CabType> ct = [];
  List<VehicleMaker> vma = [];
  List<VehicleModel> vmo = [];
  List<CabClass> cc = [];

  CabType? currct;
  VehicleMaker? currvma;
  VehicleModel? currvmo;
  CabClass? currcc;

  late VehicleInfoo vi;

  cabType(BuildContext context) async {
    loading = true;
    try {
      final response = await _vehicleInfoRepo.cabType(context);
      log("RESPONSE $response");
      ct = List<CabType>.from(
        response.map(
          (m) => CabType.fromJson(m),
        ),
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      log('Erroer $e');
    }
  }

  vehicleMaker(BuildContext context) async {
    loading = true;
    try {
      final response = await _vehicleInfoRepo.vehicleMaker(context);
      log("RESPONSE $response");
      vma = List<VehicleMaker>.from(
        response.map(
          (m) => VehicleMaker.fromJson(m),
        ),
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      log('Erroer $e');
    }
  }

  cabClass(BuildContext context, int id) async {
    loading = true;
    try {
      final response = await _vehicleInfoRepo.cabClass(context, id);
      log("RESPONSE $response");
      cc = List<CabClass>.from(
        response.map(
          (m) => CabClass.fromJson(m),
        ),
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      log('Erroer $e');
    }
  }

  vehicleModel(BuildContext context, int id) async {
    loading = true;
    try {
      final response = await _vehicleInfoRepo.vehicleModel(context, id);
      log("RESPONSE $response");
      vmo = List<VehicleModel>.from(
        response.map(
          (m) => VehicleModel.fromJson(m),
        ),
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      log('Erroer $e');
    }
  }

  submit(BuildContext context) async {
    loading = true;
    var bodytoSend = vi.toJson();
    try {
      final response = await _vehicleInfoRepo.submit(context, bodytoSend);
      Future.delayed(Duration(seconds: 2), () {
        loading = false;
        notifyListeners();
        print(response);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const SubmitScreen();
            },
          ),
        );
      });
    } catch (e) {
      log('Erroer $e');
    }
  }
}
