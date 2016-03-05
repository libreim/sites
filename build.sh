build() {
  local defaults=../_config.yml
  local config=_config.yml

  if [ -f $config ]; then
    config="$defaults,$config"
    bundle install
    bundle exec jekyll build --config $config
  else
    mkdir -p _site
    cp * _site -r
  fi
}

build_all() {
  local site_path=.site

  for site in `find *  -maxdepth 0 ! -path '*/.*' ! -path '*/_*' -type d`; do
    rm $site_path/$site -rf
    echo "Entrando en $site"
    cd $site
    build
    mkdir -p ../$site_path/$site
    mv _site/* ../$site_path/$site
    rm -rf _site/*
    echo "Saliendo de $site"
    cd ..
  done
}

serve() {
  cd $1
  ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'
  cd ..
}

build_all
serve .site
