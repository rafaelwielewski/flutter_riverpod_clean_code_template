import 'package:app/src/shared/domain/models/user.dart';
import 'package:app/src/shared/domain/providers/user_repository_provider.dart';
import 'package:app/src/shared/presentation/provider/user_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mock.dart';
import '../../test_config.dart';

void main() async {
  await setupTest();

  ProviderContainer createContainer(MockUserRepository userRepository) {
    final container = ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(userRepository),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<void>());
    registerFallbackValue(AsyncData(User.initial()));
  });

  test('get user success', () async {
    final userRepository = MockUserRepository();

    final user = User.initial();

    when(() => userRepository.getUser()).thenAnswer((_) => Future.value(user));
    final container = createContainer(userRepository);

    final listener = Listener<AsyncValue<User>>();

    container.listen(
      userControllerProvider,
      listener.call,
      fireImmediately: true,
    );

    final controller = container.read(userControllerProvider.notifier);
    await controller.getUser();

    verify(() => userRepository.getUser());

    verifyInOrder([
      () => listener(any(), any(that: isA<AsyncLoading<User>>())),
      () => listener(any(that: isA<AsyncLoading<User>>()), any(that: isA<AsyncData<User>>())),
      () => listener(any(that: isA<AsyncData<User>>()), AsyncData<User>(user)),
    ]);
    verifyNoMoreInteractions(listener);
  });

  test('get user throws exception', () async {
    final userRepository = MockUserRepository();

    when(() => userRepository.getUser()).thenThrow(Exception());
    final container = createContainer(userRepository);

    final listener = Listener<AsyncValue<User>>();

    container.listen(
      userControllerProvider,
      listener.call,
      fireImmediately: true,
    );

    final controller = container.read(userControllerProvider.notifier);
    await controller.getUser();

    verify(() => userRepository.getUser());

    verifyInOrder([
      () => listener(any(), any(that: isA<AsyncLoading>())),
      () => listener(any(that: isA<AsyncLoading<User>>()), any(that: isA<AsyncData<User>>())),
      () => listener(any(that: isA<AsyncData<User>>()), any(that: isA<AsyncError<User>>())),
    ]);
    verifyNoMoreInteractions(listener);
  });
}
