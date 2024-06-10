{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.mihajlo = {
    isNormalUser = true;
    home = "/home/mihajlo";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$PwwaDp8ZDhGJ/Lt9QHypA.$0TdqGE9u0Tbe0LX07UM/64HbehYnX0XlWy9OGEgsPc1";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXCHJP26B14+0cO2uhxmFF6A6gI+JHkwGbnRH8xhdpdKp6cL3rWKx+RfgbRwzCvAMjJBLgFPMt7KINvyaIfe8YBGLCCVfbd7C/SYvzvhsaYnI2E3zkOwCxjJfsjWDH7ObEmKVUPx8Zy++tHdLUTwzNvjuRlKFk6Ow/qwN4q4lHdYL388L3Ua65VwHSpajuPT10VhLPMQ1EBYHSzWpS/MnkiBYrX4o5Mx6cKCMMIWjTTru9Fpm11jszFyEwGuQJP9uoLDZEOEVUGxrbRJ34WSGi0bxmNz+swtmFmFtxIh+EwJWST4k9jViqjli2qV29I4MNMJwLLXCS0xDz+5znYo5b mihajlo@Mihajlos-MacBook.local"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix { inherit inputs; })
  ];
}
