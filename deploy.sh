build() {
  local config=_config.yml
  local tux=_tux.yml

  if [ -f $tux ]
    config=$config,$tux
  fi

  bundle install
  bundle exec jekyll build --config $config
}

deploy_all() {
  local site_path=_site

  for site in `find , -type d`
  do
    cd $site
    build
    mkdir -p ../$site_path/$site
    mv _site/* ../$site_path/$site
  done
}

deploy_all
