import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_assesment/core/components/app_button.dart';
import 'package:todo_assesment/core/components/app_textfield.dart';
import 'package:todo_assesment/core/components/common_app_bar.dart';
import 'package:todo_assesment/core/components/vertical_tile_element.dart';
import 'package:todo_assesment/core/theme/app_colors.dart';
import 'package:todo_assesment/src/feature/add_todo/domain/model/req/add_todo_req.dart';
import 'package:todo_assesment/src/feature/add_todo/presentations/bloc/add_todo_cubit.dart';
import 'package:todo_assesment/src/feature/todo_home/domain/model/res/todo_response.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, this.todo});

  final TodoResponse? todo;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void initState() {
    _prefilledData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(title: getAppBarTitle()),
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          children: [
            VerticalTileElement(
              label: "Title",
              child: AppTextField(
                controller: _titleController,
                hintText: "Please enter title",
                validator: (val) =>
                    context.read<AddTodoCubit>().validateTitle(val),
              ),
            ),
            VerticalTileElement(
              label: "Description",
              child: AppTextField(
                controller: _descController,
                maxLines: 6,
                hintText: "Please enter description....",
                validator: (val) =>
                    context.read<AddTodoCubit>().validateDesc(val),
              ),
            ),
            const SizedBox(height: 15),
            BlocBuilder<AddTodoCubit, AddTodoState>(
              builder: (context, state) {
                if (widget.todo != null) {
                  return Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          apistate: state.apistate,
                          backgroundColor: AppColors.red,
                          text: "Delete",
                          onPressed: () => onDeleteTodo(),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: AppButton(
                          apistate: state.apistate,
                          text: "Update",
                          onPressed: () => onUpdate(),
                        ),
                      ),
                    ],
                  );
                }
                return AppButton(
                  apistate: state.apistate,
                  text: "Save",
                  onPressed: () => onSave(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String getAppBarTitle() => widget.todo != null ? "Update TODO" : "Add TODO";

  void onSave() {
    if (isValidate) {
      context.read<AddTodoCubit>().onSave(
            title: _titleController.text,
            desc: _descController.text,
          );
    }
  }

  bool get isValidate => _formKey.currentState!.validate();

  void _prefilledData() {
    _titleController.text = widget.todo?.title ?? "";
    _descController.text = widget.todo?.description ?? "";
  }

  void onUpdate() {
    final req = AddTodoReq(
      title: _titleController.text.trim(),
      description: _descController.text.trim(),
      isCompleted: widget.todo?.isCompleted ?? false,
      id: widget.todo!.id,
      createdAt: widget.todo?.createdAt ?? "",
    );

    context.read<AddTodoCubit>().onUpdateTodo(req);
  }

  void onDeleteTodo() {
    context.read<AddTodoCubit>().onDeleteTodo(widget.todo!.id!);
  }
}
