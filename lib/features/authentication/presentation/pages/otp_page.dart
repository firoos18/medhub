import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medhub/core/common/widgets/large_button.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpPageExtra {
  final String mobileNumber;

  const OtpPageExtra({
    required this.mobileNumber,
  });
}

class OtpPage extends StatefulWidget {
  final OtpPageExtra otpPageExtra;

  const OtpPage({
    super.key,
    required this.otpPageExtra,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  final CountdownController _timerController =
      CountdownController(autoStart: true);
  bool isTimerRunning = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      isTimerRunning = true;
    });
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Color(0xff090F47),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter the verify code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'We just send you a verification code via phone ${widget.otpPageExtra.mobileNumber}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff090F47).withOpacity(0.45),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Pinput(
                  controller: _otpController,
                  autofocus: false,
                  length: 4,
                  autofillHints: const [],
                  keyboardType: TextInputType.number,
                  closeKeyboardWhenCompleted: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter OTP Code';
                    }
                    return null;
                  },
                  preFilledWidget: Text(
                    '0',
                    style: TextStyle(
                      color: const Color(0xff090F47).withOpacity(0.45),
                      fontSize: 24,
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 40,
                    height: 48,
                    textStyle: TextStyle(
                      color: const Color(0xff090F47).withOpacity(0.45),
                      fontSize: 24,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: const Color(0xff090F47).withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: LargeButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.goNamed('success');
                    }
                  },
                  label: const Text(
                    'Submit Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  isPrimary: true,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Countdown(
                  seconds: 60 * 2,
                  controller: _timerController,
                  onFinished: () => setState(() {
                    isTimerRunning = false;
                  }),
                  build: (_, double time) {
                    final minutes = Duration(seconds: time.toInt()).inMinutes;
                    final seconds =
                        Duration(seconds: time.toInt()).inSeconds % 60;

                    return Text(
                      'The verify code will expire in $minutes:${seconds >= 10 ? seconds : '0$seconds'}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff090F47).withOpacity(0.45),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _timerController.restart(),
                child: const Center(
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff00A59B),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
