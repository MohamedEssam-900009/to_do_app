sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class GetDateLoadingState extends TaskState {}

final class GetDateSuccessState extends TaskState {}

final class GetDateErrorState extends TaskState {}

final class GetStartTimeLoadingState extends TaskState {}

final class GetStartTimeSuccessState extends TaskState {}

final class GetStartTimeErrorState extends TaskState {}

final class GetEndTimeLoadingState extends TaskState {}

final class GetEndTimeSuccessState extends TaskState {}

final class GetEndTimeErrorState extends TaskState {}

final class ChangeCheckMarkIndexState extends TaskState {}

final class InsertTaskLoadingState extends TaskState {}

final class InsertTaskSuccessState extends TaskState {}

final class InsertTaskErrorState extends TaskState {}
