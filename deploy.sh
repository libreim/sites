build() {
  local defaults=../_defaults.yml
  local config=_config.yml
  local tux=_tux.yml

  if [ -f $config ]; then
    config="$defaults,$config"

    #if [ -f $tux ]; then
    #  config="$config,$tux"
    #fi

    bundle install
    bundle exec jekyll build --config $config
  else
    mkdir -p _site
    cp * _site -r
  fi
}

deploy_all() {
  local site_path=.site
  mkdir -p $site_path
  rm $site_path/* -rf

  for site in `find *  -maxdepth 0 ! -path '*/.*' ! -path '*/_*' -type d`; do
    echo "Entrando en $site"
    cd $site
    build
    if [ $site == "home" ]; then
      mv _site/* ../$site_path/
    else
      mkdir -p ../$site_path/$site
      mv _site/* ../$site_path/$site
    fi
    rm -rf _site/*
    echo "Saliendo de $site"
    cd ..
  done
}

deploy_all
