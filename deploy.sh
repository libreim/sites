build() {
  local config=_config.yml
  local tux=_tux.yml

  if [ -f $config ]; then
    if [ -f $tux ]; then
      config="$config,$tux"
    fi

    bundle install
    bundle exec jekyll build --config $config
  else
    mkdir -p _site
    cp * _site -r
  fi
}

deploy_all() {
  local site_path=.site

  for site in `find *  -maxdepth 0 ! -path '*/.*' ! -path '*/_*' -type d`; do
    echo "Entrando en $site"
    cd $site
    build
    mkdir -p ../$site_path/$site
    mv _site/* ../$site_path/$site
    rm -r _site/*
    echo "Saliendo de $site"
    cd ..
  done
}

deploy_all
