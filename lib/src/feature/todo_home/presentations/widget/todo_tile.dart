import 'package:flutter/material.dart';
import 'package:todo_assesment/core/theme/app_colors.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';
import '../../../../../core/theme/app_textstyle.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.onTileClick,
    required this.todoResponse,
    this.onCompleted,
  });

  final VoidCallback onTileClick;
  final TodoResponse? todoResponse;
  final void Function(bool? val)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTileClick,
      title: Text(todoResponse?.title ?? "", style: AppTextStyle.title.medium),
      subtitle: Text(todoResponse?.description ?? "",
          style: AppTextStyle.title.small),
      trailing: Checkbox(
        value: todoResponse?.isCompleted ?? false,
        onChanged: onCompleted,
        activeColor: AppColors.teal,
        side: const BorderSide(color: AppColors.teal, width: 2),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
    );
  }
}
