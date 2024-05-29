import 'package:education_app/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PopScope extends StatelessWidget {
  const PopScope({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<PopNotification>(
      onNotification: (notification) {
        if (!notification.didPop) {
          context.pop();
        }
        return true;
      },
      child: child,
    );
  }
}

class PopNotification extends Notification {
  // ignore: avoid_positional_boolean_parameters
  PopNotification(this.didPop);
  final bool didPop;
}

class NestedBackButton extends StatelessWidget {
  const NestedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: IconButton(
        onPressed: () {
          try {
            context.pop();
          } catch (_) {
            Navigator.of(context).pop();
          }
        },
        icon: Icon(
          Theme.of(context).platform == TargetPlatform.iOS
              ? Icons.arrow_back_ios_new
              : Icons.arrow_back,
        ),
      ),
    );
  }
}
