import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/src/custom/custom_dialog.dart';
import 'package:flutter_smart_dialog/src/custom/custom_loading.dart';
import 'package:flutter_smart_dialog/src/custom/custom_toast.dart';
import 'package:flutter_smart_dialog/src/data/dialog_info.dart';
import 'package:flutter_smart_dialog/src/widget/attach_dialog_widget.dart';
import 'package:flutter_smart_dialog/src/widget/helper/toast_helper.dart';

import '../config/enum_config.dart';
import '../config/smart_config.dart';
import '../data/animation_param.dart';
import '../init_dialog.dart';
import '../widget/helper/smart_overlay_entry.dart';

class DialogProxy {
  late SmartConfig config;
  late SmartOverlayEntry entryToast;
  late SmartOverlayEntry entryLoading;
  late Queue<DialogInfo> dialogQueue;
  late CustomToast _toast;
  late CustomLoading _loading;

  bool loadingBackDismiss = true;
  DateTime? dialogLastTime;

  factory DialogProxy() => instance;
  static DialogProxy? _instance;

  static DialogProxy get instance => _instance ??= DialogProxy._internal();

  static late BuildContext contextOverlay;
  static BuildContext? contextNavigator;

  ///set default loading widget
  late FlutterSmartLoadingBuilder loadingBuilder;

  ///set default toast widget
  late FlutterSmartToastBuilder toastBuilder;

  DialogProxy._internal() {
    config = SmartConfig();

    dialogQueue = ListQueue();
  }

  void initialize() {
    entryLoading = SmartOverlayEntry(builder: (_) => _loading.getWidget());
    _loading = CustomLoading(overlayEntry: entryLoading);
    entryToast = SmartOverlayEntry(builder: (_) => _toast.getWidget());
    _toast = CustomToast(overlayEntry: entryToast);
  }

  Future<T?> show<T>({
    required Widget widget,
    required AlignmentGeometry alignment,
    required bool usePenetrate,
    required bool useAnimation,
    required Duration animationTime,
    required SmartAnimationType animationType,
    required AnimationBuilder? animationBuilder,
    required Color maskColor,
    required bool clickMaskDismiss,
    required Widget? maskWidget,
    required bool debounce,
    required VoidCallback? onDismiss,
    required VoidCallback? onMask,
    required Duration? displayTime,
    required String? tag,
    required bool backDismiss,
    required bool keepSingle,
    required bool permanent,
    required bool useSystem,
    required bool bindPage,
  }) {
    CustomDialog? dialog;
    var entry = SmartOverlayEntry(
      builder: (BuildContext context) => dialog!.getWidget(),
    );
    dialog = CustomDialog(overlayEntry: entry);
    return dialog.show<T>(
      widget: widget,
      alignment: alignment,
      usePenetrate: usePenetrate,
      useAnimation: useAnimation,
      animationTime: animationTime,
      animationType: animationType,
      animationBuilder: animationBuilder,
      maskColor: maskColor,
      maskWidget: maskWidget,
      clickMaskDismiss: clickMaskDismiss,
      debounce: debounce,
      onDismiss: onDismiss,
      onMask: onMask,
      displayTime: displayTime,
      tag: tag,
      backDismiss: backDismiss,
      keepSingle: keepSingle,
      permanent: permanent,
      useSystem: useSystem,
      bindPage: bindPage,
    );
  }

  Future<T?> showAttach<T>({
    required BuildContext? targetContext,
    required Widget widget,
    required TargetBuilder? targetBuilder,
    required ReplaceBuilder? replaceBuilder,
    required AlignmentGeometry alignment,
    required bool usePenetrate,
    required bool useAnimation,
    required Duration animationTime,
    required SmartAnimationType animationType,
    required AnimationBuilder? animationBuilder,
    required ScalePointBuilder? scalePointBuilder,
    required Color maskColor,
    required bool clickMaskDismiss,
    required Widget? maskWidget,
    required HighlightBuilder? highlightBuilder,
    required bool debounce,
    required VoidCallback? onDismiss,
    required VoidCallback? onMask,
    required Duration? displayTime,
    required String? tag,
    required bool backDismiss,
    required bool keepSingle,
    required bool permanent,
    required bool useSystem,
    required bool bindPage,
  }) {
    CustomDialog? dialog;
    var entry = SmartOverlayEntry(
      builder: (BuildContext context) => dialog!.getWidget(),
    );
    dialog = CustomDialog(overlayEntry: entry);
    return dialog.showAttach<T>(
      targetContext: targetContext,
      widget: widget,
      targetBuilder: targetBuilder,
      replaceBuilder: replaceBuilder,
      alignment: alignment,
      usePenetrate: usePenetrate,
      useAnimation: useAnimation,
      animationTime: animationTime,
      animationType: animationType,
      animationBuilder: animationBuilder,
      scalePointBuilder: scalePointBuilder,
      maskColor: maskColor,
      maskWidget: maskWidget,
      highlightBuilder: highlightBuilder,
      clickMaskDismiss: clickMaskDismiss,
      debounce: debounce,
      onDismiss: onDismiss,
      onMask: onMask,
      displayTime: displayTime,
      tag: tag,
      backDismiss: backDismiss,
      keepSingle: keepSingle,
      permanent: permanent,
      useSystem: useSystem,
      bindPage: bindPage,
    );
  }

  Future<T?> showLoading<T>({
    required bool clickMaskDismiss,
    required SmartAnimationType animationType,
    required AnimationBuilder? animationBuilder,
    required bool usePenetrate,
    required bool useAnimation,
    required Duration animationTime,
    required Color maskColor,
    required Widget? maskWidget,
    required VoidCallback? onDismiss,
    required VoidCallback? onMask,
    required Duration? displayTime,
    required bool backDismiss,
    required Widget widget,
  }) {
    return _loading.showLoading<T>(
      clickMaskDismiss: clickMaskDismiss,
      animationType: animationType,
      animationBuilder: animationBuilder,
      maskColor: maskColor,
      maskWidget: maskWidget,
      usePenetrate: usePenetrate,
      useAnimation: useAnimation,
      animationTime: animationTime,
      onDismiss: onDismiss,
      onMask: onMask,
      displayTime: displayTime,
      backDismiss: backDismiss,
      widget: widget,
    );
  }

  Future<void> showToast({
    required AlignmentGeometry alignment,
    required bool clickMaskDismiss,
    required SmartAnimationType animationType,
    required AnimationBuilder? animationBuilder,
    required bool usePenetrate,
    required bool useAnimation,
    required Duration animationTime,
    required Color maskColor,
    required Widget? maskWidget,
    required bool consumeEvent,
    required Duration displayTime,
    required bool debounce,
    required SmartToastType displayType,
    required Widget widget,
  }) {
    return _toast.showToast(
      alignment: alignment,
      clickMaskDismiss: clickMaskDismiss,
      animationType: animationType,
      animationBuilder: animationBuilder,
      usePenetrate: usePenetrate,
      useAnimation: useAnimation,
      animationTime: animationTime,
      maskColor: maskColor,
      maskWidget: maskWidget,
      displayTime: displayTime,
      debounce: debounce,
      displayType: displayType,
      widget: ToastHelper(consumeEvent: consumeEvent, child: widget),
    );
  }

  Future<void>? dismiss<T>({
    required SmartStatus status,
    bool back = false,
    String? tag,
    T? result,
    bool force = false,
  }) {
    if (status == SmartStatus.smart) {
      var loading = config.isExistLoading;
      if (!loading) {
        return CustomDialog.dismiss<T>(
          type: DialogType.dialog,
          back: back,
          tag: tag,
          result: result,
          force: force,
        );
      }
      if (loading) return _loading.dismiss(back: back);
    } else if (status == SmartStatus.toast) {
      return _toast.dismiss();
    } else if (status == SmartStatus.allToast) {
      return _toast.dismiss(closeAll: true);
    } else if (status == SmartStatus.loading) {
      return _loading.dismiss(back: back);
    }

    DialogType? type = _convertEnum(status);
    if (type == null) return null;
    return CustomDialog.dismiss<T>(
      type: type,
      back: back,
      tag: tag,
      result: result,
      force: force,
    );
  }

  DialogType? _convertEnum(SmartStatus status) {
    if (status == SmartStatus.dialog) {
      return DialogType.dialog;
    } else if (status == SmartStatus.custom) {
      return DialogType.custom;
    } else if (status == SmartStatus.attach) {
      return DialogType.attach;
    } else if (status == SmartStatus.allDialog) {
      return DialogType.allDialog;
    } else if (status == SmartStatus.allCustom) {
      return DialogType.allCustom;
    } else if (status == SmartStatus.allAttach) {
      return DialogType.allAttach;
    }
    return null;
  }
}
