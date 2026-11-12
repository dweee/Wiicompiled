{
  # Match the reviewed public package systems; no private or game outputs.
  systems = [
    "x86_64-linux"
    "aarch64-linux"
    "aarch64-darwin"
  ];
  allow-import-from-derivation = false;
}
