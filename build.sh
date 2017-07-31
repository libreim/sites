build() {
  local defaults=../_config.yml
  local config=_config.yml
  local destination=../$1/$2

  mkdir -p $destination
  if [ -f $config ]; then
    config="$defaults,$config"
    bundle install
    bundle exec jekyll build --config $config --destination $destination --watch &
  else
    cp * $destination -r
  fi
}

build_all() {
  local site_path=.site

  for site in `find *  -maxdepth 0 ! -path '*/.*' ! -path '*/_*' -type d`; do
    rm $site_path/$site -rf
    echo "Entrando en $site"
    cd $site
    if [ $site == "home" ]; then
      build $site_path .
    else
      build $site_path $site
    fi
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
#
