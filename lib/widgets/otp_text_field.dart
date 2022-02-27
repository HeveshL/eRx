import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FieldStyle { underline, box }

class OtpFieldStyle {
  /// The background color for outlined box.
  final Color backgroundColor;

  /// The border color text field.
  final Color borderColor;

  /// The border color of text field when in focus.
  final Color focusBorderColor;

  /// The border color of text field when disabled.
  final Color disabledBorderColor;

  /// The border color of text field when in focus.
  final Color enabledBorderColor;

  /// The border color of text field when disabled.
  final Color errorBorderColor;

  OtpFieldStyle({
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.black26,
    this.focusBorderColor = Colors.blue,
    this.disabledBorderColor = Colors.grey,
    this.enabledBorderColor = Colors.black26,
    this.errorBorderColor = Colors.red,
  });
}

class OTPTextField extends StatefulWidget {
  /// TextField Controller
  final OtpFieldController? controller;

  /// Number of the OTP Fields
  final int length;

  /// Total Width of the OTP Text Field
  final double width;

  /// Width of the single OTP Field
  final double fieldWidth;

  /// margin around the text fields
  final EdgeInsetsGeometry margin;

  /// Manage the type of keyboard that shows up
  final TextInputType keyboardType;

  /// The style to use for the text being edited.
  final TextStyle style;

  /// The style to use for the text being edited.
  final double outlineBorderRadius;

  /// Text Field Alignment
  /// default: MainAxisAlignment.spaceBetween [MainAxisAlignment]
  final MainAxisAlignment textFieldAlignment;

  /// Obscure Text if data is sensitive
  final bool obscureText;

  /// Text Field Style
  final OtpFieldStyle? otpFieldStyle;

  /// Text Field Style for field shape.
  /// default FieldStyle.underline [FieldStyle]
  final FieldStyle fieldStyle;

  /// Callback function, called when a change is detected to the pin.
  final ValueChanged<String>? onChanged;

  /// Callback function, called when pin is completed.
  final ValueChanged<String>? onCompleted;

  const OTPTextField({
    this.length = 4,
    this.width = 10,
    this.controller,
    this.fieldWidth = 30,
    this.margin = const EdgeInsets.symmetric(horizontal: 3),
    this.otpFieldStyle,
    this.keyboardType = TextInputType.number,
    this.style = const TextStyle(),
    this.outlineBorderRadius = 10,
    this.textFieldAlignment = MainAxisAlignment.spaceBetween,
    this.obscureText = false,
    this.fieldStyle = FieldStyle.underline,
    this.onChanged,
    this.onCompleted,
  }) : assert(length > 1);

  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  late OtpFieldStyle _otpFieldStyle;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  late List<Widget> _textFields;
  late List<String> _pin;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.setOtpTextFieldState(this);
    }

    if (widget.otpFieldStyle == null) {
      _otpFieldStyle = OtpFieldStyle();
    } else {
      _otpFieldStyle = widget.otpFieldStyle!;
    }

    super.initState();

    _focusNodes = List<FocusNode?>.filled(
      widget.length,
      null,
    );
    _textControllers = List<TextEditingController?>.filled(
      widget.length,
      null,
    );

    _pin = List.generate(widget.length, (int i) {
      return '';
    });
    _textFields = List.generate(widget.length, (int i) {
      return buildTextField(context, i);
    });
  }

  @override
  void dispose() {
    for (final controller in _textControllers) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: widget.textFieldAlignment,
        children: _textFields,
      ),
    );
  }

  /// This function Build and returns individual TextField item.
  ///
  /// * Requires a build context
  /// * Requires Int position of the field
  Widget buildTextField(BuildContext context, int i) {
    if (_focusNodes[i] == null) _focusNodes[i] = FocusNode();

    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
    }

    return Container(
      width: widget.fieldWidth,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: _otpFieldStyle.backgroundColor,
        borderRadius: BorderRadius.circular(widget.outlineBorderRadius),
      ),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.center,
        style: widget.style,
        focusNode: _focusNodes[i],
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          counterText: "",
          border: _getBorder(_otpFieldStyle.borderColor),
          focusedBorder: _getBorder(_otpFieldStyle.focusBorderColor),
          enabledBorder: _getBorder(_otpFieldStyle.enabledBorderColor),
          disabledBorder: _getBorder(_otpFieldStyle.disabledBorderColor),
          errorBorder: _getBorder(_otpFieldStyle.errorBorderColor),
          hintText: "0",
          hintStyle: GoogleFonts.nunito(
            fontSize: 20,
            color: const Color(0xff707070).withOpacity(0.2),
          ),
        ),
        onChanged: (String str) {
          // Check if the current value at this position is empty
          // If it is move focus to previous text field.
          if (str.isEmpty) {
            if (i == 0) return;
            _focusNodes[i]!.unfocus();
            _focusNodes[i - 1]!.requestFocus();
          }

          // Update the current pin
          setState(() {
            _pin[i] = str;
          });

          // Remove focus
          if (str.isNotEmpty) _focusNodes[i]!.unfocus();
          // Set focus to the next field if available
          if (i + 1 != widget.length && str.isNotEmpty) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          }

          final String currentPin = _getCurrentPin();

          // if there are no null values that means otp is completed
          // Call the `onCompleted` callback function provided
          if (!_pin.contains(null) &&
              !_pin.contains('') &&
              currentPin.length == widget.length) {
            widget.onCompleted!(currentPin);
          }

          // Call the `onChanged` callback function
          try {
            widget.onChanged!(currentPin);
          } catch (e) {
            //
          }
        },
      ),
    );
  }

  InputBorder _getBorder(Color color) {
    return widget.fieldStyle == FieldStyle.box
        ? OutlineInputBorder(
            borderSide: BorderSide(color: color, width: 2),
            borderRadius: BorderRadius.circular(widget.outlineBorderRadius),
          )
        : UnderlineInputBorder(borderSide: BorderSide(color: color));
  }

  String _getCurrentPin() {
    String currentPin = "";
    for (final value in _pin) {
      // ignore: use_string_buffers
      currentPin += value;
    }
    return currentPin;
  }
}

class OtpFieldController {
  late _OTPTextFieldState _otpTextFieldState;

  // ignore: use_setters_to_change_properties
  void setOtpTextFieldState(_OTPTextFieldState state) {
    _otpTextFieldState = state;
  }

  void clear() {
    final textFieldLength = _otpTextFieldState.widget.length;
    _otpTextFieldState._pin = List.generate(textFieldLength, (int i) {
      return '';
    });

    final textControllers = _otpTextFieldState._textControllers;
    for (final textController in textControllers) {
      if (textController != null) {
        textController.text = '';
      }
    }

    final firstFocusNode = _otpTextFieldState._focusNodes[0];
    if (firstFocusNode != null) {
      firstFocusNode.requestFocus();
    }
  }

  void set(List<String> pin) {
    final textFieldLength = _otpTextFieldState.widget.length;
    if (pin.length < textFieldLength) {
      throw Exception(
        "Pin length must be same as field length. Expected: $textFieldLength, Found ${pin.length}",
      );
    }

    _otpTextFieldState._pin = pin;
    String newPin = '';

    final textControllers = _otpTextFieldState._textControllers;
    for (int i = 0; i < textControllers.length; i++) {
      final textController = textControllers[i];
      final pinValue = pin[i];
      // ignore: use_string_buffers
      newPin += pinValue;

      if (textController != null) {
        textController.text = pinValue;
      }
    }

    final widget = _otpTextFieldState.widget;
    if (widget.onChanged != null) {
      // ignore: prefer_null_aware_method_calls
      widget.onChanged!(newPin);
    }
    if (widget.onCompleted != null) {
      // ignore: prefer_null_aware_method_calls
      widget.onCompleted!(newPin);
    }
  }

  void setValue(String value, int position) {
    final maxIndex = _otpTextFieldState.widget.length - 1;
    if (position > maxIndex) {
      throw Exception(
        "Provided position is out of bounds for the OtpTextField",
      );
    }

    final textControllers = _otpTextFieldState._textControllers;
    final textController = textControllers[position];
    final currentPin = _otpTextFieldState._pin;

    if (textController != null) {
      textController.text = value;
      currentPin[position] = value;
    }

    String newPin = "";
    for (final item in currentPin) {
      // ignore: use_string_buffers
      newPin += item;
    }

    final widget = _otpTextFieldState.widget;
    if (widget.onChanged != null) {
      // ignore: prefer_null_aware_method_calls
      widget.onChanged!(newPin);
    }
  }

  void setFocus(int position) {
    final maxIndex = _otpTextFieldState.widget.length - 1;
    if (position > maxIndex) {
      throw Exception(
        "Provided position is out of bounds for the OtpTextField",
      );
    }

    final focusNodes = _otpTextFieldState._focusNodes;
    final focusNode = focusNodes[position];

    if (focusNode != null) {
      focusNode.requestFocus();
    }
  }
}
