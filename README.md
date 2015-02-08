# rbar
Playing around with R/Shiny/TABC Data

Thanks to http://zetashapes.com/ for the neighborhood geojson!

To install R and Shiny and Shiny Server on a AWS EC2 Ubuntu Instance:

$ cd /etc/apt/; vi sources.list

add   deb http://http://cran.cnr.Berkeley.edu//bin/linux/ubuntu trusty/
or don't

$ sudo apt-get install r-base

$ sudo su - \
-c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""

$ sudo apt-get install gdebi-core
$ wget http://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.3.0.403-amd64.deb
$ sudo gdebi shiny-server-1.3.0.403-amd64.deb

To install ggplot2 and whatever other libraries you think are cool to your instance, you'll need to 

$ sudo R
$ install.packages("ggplot2", lib = "/usr/local/lib/R/site-library")

