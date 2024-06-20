import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String labelText;
  final String descriptionText;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? borderEnabled;
  final GlobalKey<FormState> formKey;
  final String? initialValue;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.controller,
    required this.labelText,
    required this.descriptionText,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.textCapitalization,
    this.textInputAction,
    this.borderEnabled = true,
    required this.formKey,
    this.initialValue,
    this.enabled = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _hasError = false;
  bool _hasValidated = false;
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText!;
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    if (widget.initialValue != null) {
      widget.controller?.text = widget.initialValue!;
    }
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      Scrollable.ensureVisible(
        context,
        alignment: 0.0, // Rola para o topo do campo
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      widget.formKey.currentState?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Row(children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.only(
            bottom: _hasError ? 0 : HeightSpacing.small,
            top: HeightSpacing.small,
          ),
          alignment: Alignment.bottomCenter,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.labelText,
              style: AppTypography.inputLabel(context),
            ),
            SizedBox(height: HeightSpacing.extraSmall / 2),
            Container(
                padding: _hasError ? const EdgeInsets.only(bottom: 2) : const EdgeInsets.only(bottom: 0),
                child: TextFormField(
                  key: Key(widget.labelText),
                  enabled: widget.enabled,
                  controller: widget.controller,
                  style: AppTypography.inputText(context),
                  obscureText: _isObscure,
                  inputFormatters: widget.inputFormatters,
                  keyboardType: widget.keyboardType,
                  textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
                  validator: (value) {
                    setState(() {
                      _hasError = value != null && widget.validator != null && widget.validator!(value) != null;
                      _hasValidated = true;
                    });
                    return widget.validator?.call(value);
                  },
                  onChanged: (value) {
                    if (_hasValidated) widget.formKey.currentState?.validate();
                    widget.onChanged?.call(value);
                  },
                  textInputAction: widget.textInputAction ?? TextInputAction.done,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        widget.enabled ? ThemeProvider.of(context).themeColors.inputBackground : ThemeProvider.of(context).themeColors.disabled,
                    errorStyle: AppTypography.inputError(context),
                    errorBorder: AppBorders.inputBorderError(context),
                    focusedErrorBorder: AppBorders.focusedInputBorderError(context),
                    enabledBorder: widget.borderEnabled == true ? AppBorders.inputBorder(context) : null,
                    focusedBorder: AppBorders.focusedInputBorder(context),
                    disabledBorder: AppBorders.inputBorder(context),
                    errorMaxLines: 2,
                    contentPadding: EdgeInsets.symmetric(vertical: HeightSpacing.smallMedium, horizontal: WidthSpacing.smallMedium),
                    suffixIcon: widget.labelText.toLowerCase().contains('senha') // Verifique se labelText é "Senha"
                        ? GestureDetector(
                            child: Transform.translate(
                              offset: const Offset(0, 0),
                              child: Icon(
                                _isObscure ? Icons.visibility_off : Icons.visibility,
                                color: ThemeProvider.of(context).themeColors.body3Text,
                                size: HeightSpacing.custom(9) + 9,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )
                        : null,
                    labelText: _focusNode.hasFocus ? null : widget.descriptionText,
                    labelStyle: AppTypography.inputHint(context),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                )),
          ]),
        ))
      ]),
    );
  }
}
