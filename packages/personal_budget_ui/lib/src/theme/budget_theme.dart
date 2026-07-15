import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BudgetTheme {
  BudgetTheme._();

  // Color constants from the Stitch design system
  static const Color primaryColor = Color(0xFF004AC6);
  static const Color primaryContainerColor = Color(0xFF2563EB);
  static const Color secondaryColor = Color(0xFF006C49);
  static const Color secondaryContainerColor = Color(0xFF6CF8BB);
  static const Color tertiaryColor = Color(0xFFAB0B1C);
  static const Color errorColor = Color(0xFFBA1A1A);
  static const Color errorContainerColor = Color(0xFFFFDAD6);
  static const Color backgroundColor = Color(0xFFF7F9FB);
  static const Color surfaceColor = Color(0xFFF7F9FB);
  static const Color surfaceContainerLowestColor = Color(0xFFFFFFFF);
  static const Color onSurfaceColor = Color(0xFF191C1E);
  static const Color onSurfaceVariantColor = Color(0xFF434655);
  static const Color outlineColor = Color(0xFF737686);
  static const Color outlineVariantColor = Color(0xFFC3C6D7);

  static ThemeData get light {
    final baseTheme = ThemeData.light(useMaterial3: true);
    final colorScheme = ColorScheme.light(
      primary: primaryColor,
      primaryContainer: primaryContainerColor,
      onPrimary: Colors.white,
      onPrimaryContainer: const Color(0xFFEEEFFF),
      secondary: secondaryColor,
      secondaryContainer: secondaryContainerColor,
      onSecondary: Colors.white,
      onSecondaryContainer: const Color(0xFF00714D),
      tertiary: tertiaryColor,
      error: errorColor,
      errorContainer: errorContainerColor,
      onError: Colors.white,
      onErrorContainer: const Color(0xFF93000A),
      surface: surfaceColor,
      onSurface: onSurfaceColor,
      onSurfaceVariant: onSurfaceVariantColor,
      outline: outlineColor,
      outlineVariant: outlineVariantColor,
      surfaceContainerLowest: surfaceContainerLowestColor,
      surfaceContainerLow: const Color(0xFFF2F4F6),
      surfaceContainer: const Color(0xFFECEEF0),
      surfaceContainerHigh: const Color(0xFFE6E8EA),
      surfaceContainerHighest: const Color(0xFFE0E3E5),
    );

    return _buildTheme(baseTheme, colorScheme);
  }

  static ThemeData get dark {
    final baseTheme = ThemeData.dark(useMaterial3: true);
    final colorScheme = ColorScheme.dark(
      primary: const Color(0xFFB4C5FF),
      primaryContainer: primaryContainerColor,
      onPrimary: const Color(0xFF00174B),
      onPrimaryContainer: const Color(0xFFEEEFFF),
      secondary: const Color(0xFF6FFBBE),
      secondaryContainer: const Color(0xFF005236),
      onSecondary: const Color(0xFF002113),
      onSecondaryContainer: const Color(0xFF00714D),
      tertiary: const Color(0xFFFFB3AD),
      error: errorColor,
      errorContainer: const Color(0xFFFFDAD6),
      onError: const Color(0xFF93000A),
      onErrorContainer: const Color(0xFF93000A),
      surface: const Color(0xFF191C1E),
      onSurface: const Color(0xFFEFF1F3),
      onSurfaceVariant: const Color(0xFFC3C6D7),
      outline: outlineColor,
      outlineVariant: const Color(0xFF434655),
      surfaceContainerLowest: const Color(0xFF0D0F11),
      surfaceContainerLow: const Color(0xFF1D2022),
      surfaceContainer: const Color(0xFF222527),
      surfaceContainerHigh: const Color(0xFF282B2E),
      surfaceContainerHighest: const Color(0xFF33363A),
    );

    return _buildTheme(baseTheme, colorScheme);
  }

  static ThemeData _buildTheme(ThemeData baseTheme, ColorScheme colorScheme) {
    // Premium text theme combining Inter and Plus Jakarta Sans
    final textTheme = GoogleFonts.interTextTheme(baseTheme.textTheme).copyWith(
      displayLarge: GoogleFonts.plusJakartaSans(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.02,
        color: colorScheme.onSurface,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.01,
        color: colorScheme.onSurface,
      ),
      displaySmall: GoogleFonts.plusJakartaSans(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurfaceVariant,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.01,
        color: colorScheme.onSurface,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurfaceVariant,
      ),
    );

    return baseTheme.copyWith(
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outlineVariant.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        prefixIconColor: colorScheme.outline,
        suffixIconColor: colorScheme.outline,
        labelStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
        hintStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
      ),
    );
  }
}
