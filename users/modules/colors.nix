{lib, ...}:
with lib; {
  options.colors.raw = mkOption {};
  options.colors.base = mkOption {};
  options.colors.base16Hex = mkOption {};
}
