{
  description = "Home Manager configuration of josh";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: {

    homeConfigurations = {
      # x86_64-linux is for 64-bit x86 Linux systems
      "josh@nix-3" = home-manager.lib.homeManagerConfiguration {
        modules = [ ./home.nix ];
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {
          pkgs-unstable = nixpkgs-unstable.legacyPackages."x86_64-linux";
          username = "josh";
          homeDirectory = "/home/josh";
        };
      };

      # There's also other architectures
      # * aarch64-linux for 64-bit ARM
      # * x86_64-darwin for macOS
      # * aarch64-darwin for Apple Slicon
      # * x86_64-windows for Windows 64-bit

    };
  };
}
