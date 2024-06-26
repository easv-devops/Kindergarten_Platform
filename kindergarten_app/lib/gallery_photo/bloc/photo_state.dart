import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kindergarten_app/gallery_photo/models/photo_model.dart';

part 'photo_state.freezed.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default([]) List<Gallery> lastPhotos,
    @Default([]) List<Uint8List> photoData,
  }) = _GalleryState;

  factory GalleryState.empty() => const GalleryState(
    lastPhotos: [],
  );
}