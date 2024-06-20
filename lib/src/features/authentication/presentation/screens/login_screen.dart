import 'package:app/src/features/authentication/presentation/provider/auth_state_provider.dart';
import 'package:app/src/features/authentication/presentation/provider/login_password_controller_provider.dart';
import 'package:app/src/features/authentication/presentation/widgets/greetings_home_widget.dart';
import 'package:app/src/shared/domain/enums/color_type.dart';
import 'package:app/src/shared/presentation/provider/user_controller.dart';
import 'package:app/src/shared/presentation/widgets/appbar.dart';
import 'package:app/src/shared/presentation/widgets/custom_button.dart';
import 'package:app/src/shared/presentation/widgets/custom_text_button.dart';
import 'package:app/src/shared/presentation/widgets/custom_text_field.dart';
import 'package:app/src/utils/validators/validate_input.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/src/shared/presentation/styles/styles.dart';
import 'package:app/src/utils/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKeys = List.generate(2, (index) => GlobalKey<FormState>());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      loginPasswordControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return DefaultLayout(
      appBar: const AppBarDefault(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (ref.watch(authStateProvider).login.isNotEmpty) GreetingsHomeWidget(firstName: ref.watch(userControllerProvider).value?.firstName),
          if (ref.watch(authStateProvider).login.isEmpty)
            CustomTextField(
              formKey: formKeys[0],
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailController,
              labelText: 'Email',
              descriptionText: 'Digite seu email',
              validator: (email) {
                return ValidateInput.email(email);
              },
            ),
          CustomTextField(
            formKey: formKeys[1],
            keyboardType: TextInputType.text,
            controller: passwordController,
            labelText: 'Senha',
            descriptionText: 'Digite sua senha',
            obscureText: true,
            validator: (password) {
              return ValidateInput.password(password);
            },
          ),
          const Spacer(),
          if (ref.watch(authStateProvider).login.isNotEmpty)
            CustomButton(
              text: 'Login',
              color: ColorType.primary,
              onPressed: () {
                ref.read(loginPasswordControllerProvider.notifier).loginWithPassword(passwordController.text);
              },
              isValid: () => formKeys[1].currentState!.validate(),
              isLoading: ref.watch(loginPasswordControllerProvider) is AsyncLoading,
            )
          else
            CustomButton(
              text: 'Login',
              color: ColorType.primary,
              onPressed: () {
                ref.read(loginPasswordControllerProvider.notifier).login(
                      emailController.text,
                      passwordController.text,
                    );
              },
              isValid: () => formKeys.map((formKey) => formKey.currentState!.validate()).reduce((v, e) => v && e),
              isLoading: ref.watch(loginPasswordControllerProvider) is AsyncLoading,
            ),
          CustomTextButton(
            color: ThemeProvider.of(context).appColors.primary,
            onPressed: () {},
            text: 'Esqueci minha senha',
          ),
        ],
      ),
    );
  }
}
