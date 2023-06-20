with import <nixpkgs> {};

let
  gems = pkgs.bundlerEnv {
    name = "jekyll-gems";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "jekyll_env";
  src = "./";
  buildInputs = [
    bundler
    gems
    ruby
    bundix
    jekyll
  ];
  shellHook = ''
    exec bundle exec jekyll serve --watch
  '';
}
