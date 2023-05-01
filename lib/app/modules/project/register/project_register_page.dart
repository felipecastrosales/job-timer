import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_with_loader.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({
    super.key,
    required this.controller,
  });

  final ProjectRegisterController controller;

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _estimateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _estimateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterStatus.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Error when save project').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Criar novo projeto',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    label: Text('Project Name'),
                  ),
                  validator: Validatorless.required('Name is required'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _estimateController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Hours estimates'),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Hours is required'),
                    Validatorless.number('Only numbers allowed.'),
                  ]),
                ),
                const SizedBox(height: 12),
                BlocSelector<ProjectRegisterController, ProjectRegisterStatus,
                    bool>(
                  bloc: widget.controller,
                  selector: (state) => state == ProjectRegisterStatus.loading,
                  builder: (context, state) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      child: ButtonWithLoader<ProjectRegisterController,
                          ProjectRegisterStatus>(
                        bloc: widget.controller,
                        selector: (state) =>
                            state == ProjectRegisterStatus.loading,
                        onPressed: () async {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;

                          if (formValid) {
                            final name = _nameController.text;
                            final estimate =
                                int.parse(_estimateController.text);
                            widget.controller.register(name, estimate);
                          }
                        },
                        label: 'Save',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
