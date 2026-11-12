{
  description = "Public WiiCompiled source, translator and native runtime packaging";

  inputs = {
    self.submodules = true;
    nixpkgs.url = "github:NixOS/nixpkgs/1d060086d60cb76a40cf37109f979d88a5bd6396";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
      forSystems = nixpkgs.lib.genAttrs systems;
      overlay = import ./nix/overlay.nix self;
      packagesFor =
        system:
        import nixpkgs {
          inherit system;
          overlays = [ overlay ];
        };
    in
    {
      overlays.default = overlay;
      packages = forSystems (
        system:
        let
          pkgs = packagesFor system;
        in
        {
          inherit (pkgs)
            wiicompiled-translator
            wiicompiled-native-prebuilt
            wiicompiled-setup
            ;
          default = pkgs.wiicompiled-translator;
        }
        // nixpkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
          wiicompiled-setup-unwrapped = pkgs.wiicompiled-setup.setupUnwrapped;
        }
      );
      devShells = forSystems (
        system:
        let
          pkgs = packagesFor system;
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              cmake
              ninja
              clang
              python3
              dotnetCorePackages.sdk_8_0
            ];
          };
        }
      );
    };
}
