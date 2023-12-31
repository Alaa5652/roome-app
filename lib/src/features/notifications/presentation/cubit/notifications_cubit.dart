import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/notifications/data/models/notification_model.dart';
import 'package:roome/src/features/notifications/domain/entities/add_to_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/entities/remove_from_notifications_params.dart';
import 'package:roome/src/features/notifications/domain/usecases/add_to_notifications_usecase.dart';
import 'package:roome/src/features/notifications/domain/usecases/remove_from_notifications_usecase.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final AddToNotificationsUseCase addToNotificationsUseCase;
  final RemoveFromNotificationsUseCase removeFromNotificationsUseCase;

  NotificationsCubit({
    required this.addToNotificationsUseCase,
    required this.removeFromNotificationsUseCase,
  }) : super(const NotificationsInitial());

  List<NotificationsModel> notifications = <NotificationsModel>[];

  void getNotifications() {
    emit(GetNotificationsState(notifications: notifications));
  }

  void addToNotifications({
    required AddToNotificationsParams params,
  }) {
    addToNotificationsUseCase(params).then((value) {
      value.fold(
        (failure) => emit(
          AddToNotificationsErrorState(error: failure.failureMsg.toString()),
        ),
        (notification) {
          getNotifications();
          emit(AddToNotificationsSuccessState(notification: notification));
        },
      );
    });
  }

  void removeFromNotifications({
    required RemoveFromNotificationsParams params,
  }) {
    removeFromNotificationsUseCase(params).then((value) {
      value.fold(
        (failure) => emit(
          RemoveFromNotificationsErrorState(
              error: failure.failureMsg.toString()),
        ),
        (notification) {
          getNotifications();
          emit(RemoveFromNotificationsSuccessState(notification: notification));
        },
      );
    });
  }
}
