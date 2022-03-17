import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erx/utils/color_palette.dart';
import 'package:erx/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPrescriptionScreen extends StatefulWidget {
  const NewPrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<NewPrescriptionScreen> createState() => _NewPrescriptionScreenState();
}

class _NewPrescriptionScreenState extends State<NewPrescriptionScreen> {
  final TextEditingController _hospitalNameController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientNumberController =
      TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bpController = TextEditingController();
  final TextEditingController _knownHistoryController = TextEditingController();
  final TextEditingController _diagnosisController = TextEditingController();
  final TextEditingController _adviceController = TextEditingController();
  final TextEditingController _followUpController = TextEditingController();

  @override
  void dispose() {
    _hospitalNameController.dispose();
    _patientNameController.dispose();
    _patientNumberController.dispose();
    _ageController.dispose();
    _genderController.dispose();
    _temperatureController.dispose();
    _weightController.dispose();
    _bpController.dispose();
    _knownHistoryController.dispose();
    _diagnosisController.dispose();
    _adviceController.dispose();
    _followUpController.dispose();
    super.dispose();
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    TextInputType type = TextInputType.text,
  }) {
    return TextField(
      textInputAction: TextInputAction.done,
      controller: controller,
      keyboardType: type,
      style: GoogleFonts.nunito(
        fontSize: 20,
        color: ColorPalette.honeyDew,
      ),
      decoration: InputDecoration(
        helperText: hint,
        helperStyle: GoogleFonts.nunito(
          fontSize: 20,
          color: ColorPalette.malachiteGreen,
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
      cursorColor: ColorPalette.honeyDew,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Prescription")),
      backgroundColor: ColorPalette.chineseBlack,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildTextField(_hospitalNameController, "Hospital Name"),
                  _buildTextField(_patientNameController, "Patient Name"),
                  _buildTextField(
                    _patientNumberController,
                    "Patient Number",
                    type: TextInputType.number,
                  ),
                  _buildTextField(
                    _ageController,
                    "Age",
                    type: TextInputType.number,
                  ),
                  _buildTextField(_genderController, "Gender"),
                  _buildTextField(
                    _temperatureController,
                    "Temperature",
                    type: TextInputType.number,
                  ),
                  _buildTextField(
                    _weightController,
                    "Weight",
                    type: TextInputType.number,
                  ),
                  _buildTextField(
                    _bpController,
                    "BP",
                    type: TextInputType.number,
                  ),
                  _buildTextField(_knownHistoryController, "Known History"),
                  _buildTextField(_diagnosisController, "Diagnosis"),
                  _buildTextField(_adviceController, "Advice"),
                  _buildTextField(_followUpController, "Follow Up"),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    final String _docID =
                        FirebaseAuth.instance.currentUser!.phoneNumber!;
                    final String _docName = (await FirebaseFirestore.instance
                            .collection("doctor")
                            .doc(_docID)
                            .get())
                        .data()!["name"] as String;
                    FirebaseFirestore.instance.collection("prescription").add({
                      "doctorID": _docID,
                      "doctorName": _docName,
                      "hospital": _hospitalNameController.text,
                      "dateTime": DateTime.now(),
                      "patientPhone": "+91${_patientNumberController.text}",
                      "patient": {
                        "name": _patientNameController.text,
                        "age": _ageController.text,
                        "gender": _ageController.text,
                        "generalInfo": {
                          "temperature": _temperatureController.text,
                          "bp": _bpController.text,
                          "weight": _weightController.text,
                        },
                      },
                      "knownHistory": _knownHistoryController.text,
                      "diagnosis": _diagnosisController.text,
                      "advice": _adviceController.text,
                      "followUp": _followUpController.text,
                    }).then((value) {
                      showTextToast("Prescription added successfully");
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Icon(Icons.done),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
