/// ### Guidelines
/// Dimensions should only contain generic elements, ideally in the format [type][size]

abstract class Dimensions {
  // Default definition
  static const double zero = 0;
  static const double minute = 2.0;
  static const double extraExtraSmall = 4.0;
  static const double extraSmall = 8.0;
  static const double smallHalved = 6.0;
  static const double small = 12.0;
  static const double regular = 16.0;
  static const double mediumHalved = 10.0;
  static const double medium = 20.0;
  static const double large = 30.0;
  static const double semiLarge = 50.0;
  static const double extraLarge = 60.0;

  // Padding - Space between siblings
  static const double paddingExtraExtraSmall = extraExtraSmall;
  static const double paddingExtraSmall = extraSmall;
  static const double paddingSmallHalved = smallHalved;
  static const double paddingSmall = small;
  static const double paddingRegular = regular;
  static const double paddingDefault = paddingRegular;
  static const double paddingMedium = medium;
  static const double paddingLarge = large;
  static const double paddingExtraLarge = extraLarge;

  // Margins - Space between a container's bounds and its content
  static const double marginExtraSmall = 8.0;
  static const double marginSmall = 12.0;
  static const double marginRegular = 16.0;
  static const double marginMedium = 24.0;
  static const double marginLarge = 32.0;
  static const double marginExtraLarge = 48.0;

  // Buttons
  static const double buttonHeightRegular = 48.0;
  static const double buttonHeightLarge = 58.0;
  static const double buttonWidthRegular = 203.0;

  // Image
  static const double imageHeightLarge = 96.0;
  static const double imageDimensionMedium = 48.0;

  // Radius
  static const double radiusSmall = 2.0;
  static const double radiusMedium = 3.0;
  static const double radiusLarge = 4.0;
  static const double radiusExtraLarge = 8.0;

  // Border
  static const double borderWidthRegular = 1.0;
  static const double borderWidthSlim = 0.5;

  // Aspect Ratio
  static const double primaryImageAspectRatio = 1;
  static const double aspectRatioTallRegular = 3 / 4;
  static const double gridItemAspectRatio = 0.6;
  static const double largeDeviceGridItemAspectRatio = 0.55;

  // Elevation
  static const double elevationSmall = 2.0;
  static const double elevationMedium = 3.0;
  static const double elevationLarge = 6.0;

  //Dialog
  static const double maximumDialogWidth = 400.0;
}
