# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* How to set up heroku when project uses yarn:

 2004  heroku config:set NPM_CONFIG_PRODUCTION=true YARN_PRODUCTION=true
 2010  heroku run yarn install
 2023  heroku buildpacks:add --index 1 heroku/nodejs
 2028  heroku buildpacks:add --index 2 heroku/ruby
 2035  git push heroku master
 2036  heroku run rails db:migrate

* complete terminal history

 1835  heroku status
 1836  git push origin heroku
 1837  git push heroku master
 1838  gem install bundler
 1839  git push heroku master
 1840  heroku config:get BUILDPACK_URL
 1841  git status
 1842  heroku run bundle install
 1843  git push heroku master
 1844  gem install bundler
 1845  heroku run bundle install
 1846  heroku run gem install bundler
 1847  git push heroku master
 1848  heroku run rake assets:precompile
 1849  heroku buildpacks:set heroku/nodejs
 1850  git push heroku master
 1851  heroku buildpacks:set heroku/nodejs
 1852  heroku buildpacks:add heroku/ruby
 1853  git push heroku master
 1854  heroku db:migrate
 1855  heroku db migrate
 1856  heroku run rake db:migrate
 1857  heroku run rake db:seed
 1858  heroku run rails db:migrate
 1859  heroku logs --tail
 1860  run bin/yarn
 1861  run yarn
 1862  heroku logs --tail
 1863  heroku run rails console
 1864  heroku run gem install bundler
 1865  heroku restart
 1866  yarn -v
 1867  heroku buildpacks
 1868  bundle install
 1869  heroku buildpacks:clear
 1870  git push heroku master
 1871  heroku restart
 1872  heroku logs --tail
 1873  heroku run rails db:migrate
 1874  heroku run rake db:setup
 1875  gem update --system
 1876  bundle install
 1877  git push heroku master
 1878  git status
 1879  heroku create
 1880  git push heroku master
 1881  heroku open
 1882  history
 1883  heroku login
 1884  heroku open
 1885  bundle install
 1886  git status
 1887  git push heroku master
 1888  heroku run rails db:migrate
 1889  heroku run rails c
 1890  heroku log
 1891  heroku logs
 1892  heroku run rails db:migrate
 1893  rails db:migrate
 1894  history
 1895  run bundle install
 1896  heroku run bundle install
 1897  heroku run bundle update --bundler
 1898  heroku run bundle update
 1899  heroku run bundle upgrade
 1900  bundler -v
 1901  gem install bundler 1.17.1
 1902  bundler -v
 1903  gem install bundler 1.3.0
 1904  bundler install
 1905  gem install bundler 1.17.3
 1906  bundler -v
 1907  sudo apt-get update
 1908  sudo apt-get upgrade
 1909  sudo apt-get autoremove
 1910  sudo apt-get clear
 1911  sudo apt-get 
 1912  sudo apt-get update
 1913  sudo apt-get upgrade
 1914  bundler install
 1915  bundler
 1916  gem install bundler
 1917  bundler
 1918  gem install bundler
 1919  bundler
 1920  bundle exec rails test
 1921  bundle exec
 1922  bundle exec run
 1923  bundle install
 1924  rails c
 1925  echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
 1926  rails c
 1927  bundle 
 1928  git add .; git commit -m "bundler fixes"
 1929  git push origin master
 1930  git push heroku master
 1931  rails db:migrate
 1932  heroku run db:migrate
 1933  heroku run rails db:migrate
 1934  git add .; git commit -m "heroku fixes"
 1935  bundler
 1936  bundle 
 1937  git push heroku master
 1938  bundle install
 1939  git status
 1940  git add .; git commit -m "heroku fixes gemfile.lock"
 1941  git push heroku master
 1942  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
 1943  sudo apt-get update && sudo apt-get install yarn
 1944  yarn --version
 1945  wich yarn
 1946  witch yarn
 1947  which yarn
 1948  git push heroku master
 1949  yarn -V
 1950  yarn add --dev webpack webpack-dev-server
 1951  sudo apt-get update && sudo apt-get install --no-install-recommends yarn
 1952  yarn -V
 1953  cd 
 1954  ls
 1955  cd ..
 1956  ls
 1957  cd ~
 1958  ls
 1959  cd ..
 1960  ls -a
 1961  ls -a etc/
 1962  ls -a dev/
 1963  ls -a ~
 1964  vim ~/.bash_profile 
 1965  which yarn
 1966  vim ~/.bash_profile 
 1967  vim ~/.yarnrc 
 1968  yarn
 1969  which yarn
 1970  sudo apt-get update && sudo apt-get install --no-install-recommends yarn
 1971  which yarn
 1972  yarn -v
 1973  git status
 1974  cd GitHub/hojasdegasto/
 1975  git status
 1976  git push heroku master
 1977  yarn add --dev webpack webpack-dev-server
 1978  yarn status
 1979  which yarn
 1980  /usr/bin/yarn add --dev webpack webpack-dev-server
 1981  sudo apt-get install yarn
 1982  yarn
 1983  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
 1984  apt-get install -y nodejs
 1985  yarn
 1986  sudo apt-get install -y nodejs
 1987  sudo apt-get install yarn
 1988  yarn
 1989  sudo apt-get autoremove
 1990  sudo apt-get clear
 1991  sudo apt-get help
 1992  sudo apt-get clean
 1993  sudo apt-get autoclean
 1994  sudo apt-get purge
 1995  sudo apt-get upgrade
 1996  sudo apt-get update
 1997  sudo apt-get upgrade
 1998  sudo apt-get uninstall yarn
 1999  sudo apt-get remove yarn
 2000  bundle
 2001  rails s
 2002  git push heroku master
 2003  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
 2004  heroku config:set NPM_CONFIG_PRODUCTION=true YARN_PRODUCTION=true
 2005  git push heroku master
 2006  heroku buildpacks
 2007  bundle
 2008  git add .; git commit -m "heroku fixes yarn"
 2009  git push heroku master
 2010  heroku run yarn install
 2011  git push heroku master
 2012  heroku buildpacks:add --index 1 heroku/nodejs.
 2013  git push heroku master
 2014  heroku status
 2015  heroku buildpacks
 2016  heroku buildpacks clear
 2017  yarn install
 2018  heroku run yarn install
 2019  heroku buildpacks:remove heroku/nodejs
 2020  heroku buildpacks:remove heroku/nodejs -a hojadegasto
 2021  heroku buildpacks:clear
 2022  heroku buildpacks
 2023  heroku buildpacks:add --index 1 heroku/nodejs
 2024  git push heroku master
 2025  heroku open
 2026  heroku run db:migrate
 2027  heroku run rails db:migrate
 2028  heroku buildpacks:add --index 2 heroku/ruby
 2029  git push heroku master
 2030  heroku run rails db:migrate
 2031  git add .; git commit -m "heroku fixes /usr/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb"
 2032  git push heroku master
 2033  bundle
 2034  git add .; git commit -m "heroku fixes /usr/lib/ruby/2.5.0/rubygems/core_ext/kernel_require.rb"
 2035  git push heroku master
 2036  heroku run rails db:migrate
 2037  history
