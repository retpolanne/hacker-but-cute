bundle:
	nix-shell -p bundler --run "bundle install --gemfile=Gemfile --path vendor/cache --standalone"
	nix-shell -p bundler --run "bundix"
