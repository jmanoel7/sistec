ARG BASE_TAG="bookworm"
ARG BASE_IMAGE="debian"
FROM $BASE_IMAGE:$BASE_TAG

USER root
ENV HOME=/root
WORKDIR $HOME

RUN rm -rf sistec

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install r-base r-base-core r-base-dev r-base-html r-recommended shiny-server git build-essential bash sed nano procps -y

RUN sh -c "R -e \"install.packages(c('shiny', 'dplyr', 'openxlsx', 'rlang', 'stringi', 'stringr'), repos='https://cran.rstudio.com/')\""

RUN mkdir -p /srv/shiny-server && \
    cd /srv/shiny-server && \
    git clone https://github.com/jmanoel7/sistec.git && \
    R CMD build sistec && \
    R CMD INSTALL ./sistec_0.2.0.9012.tar.gz && \
    rm -rf index.html && \
    rm -rf sample-apps

RUN sed '/run_as shiny\;/a preserve_logs true\;' -i /etc/shiny-server/shiny-server.conf && \
    cd /var/log/shiny-server

#CMD ["/usr/lib/shiny-server/ext/node/bin/shiny-server /usr/lib/shiny-server/lib/main.js"]
#CMD ["/bin/bash"]
CMD ["/usr/bin/shiny-server"]
