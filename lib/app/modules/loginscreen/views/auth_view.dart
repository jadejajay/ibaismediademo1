import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late RxBool isPhoneNumberVerified;
  late RxString verificationId;

  @override
  void onInit() {
    isPhoneNumberVerified = false.obs;
    verificationId = ''.obs;
    super.onInit();
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      verificationCompleted(PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      }

      verificationFailed(FirebaseAuthException authException) {
        print('Verification failed: ${authException.message}');
        Get.snackbar('Error', 'An error occurred while verifying the number.');
      }

      codeSent(String verificationId, [int? forceResendingToken]) {
        this.verificationId.value = verificationId;
        Get.snackbar('Code Sent', 'code sent to your number');
        isPhoneNumberVerified.value = true;
      }

      codeAutoRetrievalTimeout(String verificationId) {
        this.verificationId.value = verificationId;
        Get.snackbar('Time Out', 'time over!!!!!!!!!');
      }

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print('Error verifying phone number: $e');
      Get.snackbar('Error', 'An error occurred while verifying the number.');
    }
  }

  Future<void> signInWithOTP(String otp) async {
    try {
      print("id${verificationId.value} and otp${otp}");
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      print('User logged in: ${authResult.user?.uid}');
    } catch (e) {
      print('Error signing in with OTP: $e');
      Get.snackbar('Error', 'An error occurred while signing in with OTP.');
    }
  }
}

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  final PhoneController _phoneNumberController =
      PhoneController(PhoneNumber.parse(
    '8734845201',
    destinationCountry: IsoCode.IN,
  ));
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (!_authController.isPhoneNumberVerified.value) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PhoneFormField(controller: _phoneNumberController),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final phoneNumber = _phoneNumberController;

                        final ph =
                            "+${phoneNumber.value?.countryCode}${phoneNumber.value?.nsn}";
                        _authController.verifyPhoneNumber(ph);
                      },
                      child: const Text('Verify Phone Number'),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter OTP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final otp = _otpController.text.trim();
                        _authController.signInWithOTP(otp);
                      },
                      child: const Text('Verify OTP'),
                    ),
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
