FROM r-base

RUN R -e "install.packages(c('plyr', 'grid', 'getopt', 'proto', 'ggplot2'), dependencies=TRUE, repos='http://cran.rstudio.com/')"

WORKDIR /plot

COPY . .
