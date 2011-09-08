All bundles are installed as submodules and loaded using pathogen.

I use vim-bundler to manage the plugins. The plugin manifest is one directory up
(couldn't find an easy way around this using vim-bundler).

  gem install vim-bundler

To install a new plugin, add it to the vim_bundles manifest, then run:

  vbundle install
