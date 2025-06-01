{
  description = "Python development shell from unstable";

  inputs = {
    # Define nixpkgs as an input, pointing to the unstable branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # You could also pin to a specific commit:
    # nixpkgs.url = "github:NixOS/nixpkgs/YOUR_COMMIT_HASH";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [
          # Select the python version from the *flake's* nixpkgs input
          (python312.withPackages (ps: with ps; [
            yt-dlp
            firebase-admin
          ]))
        ];

        shellHook = ''
          echo "Entering flake-based python development from unstable."
          echo "Using Python from: $(which python3)"
        '';
      };
    };
}
