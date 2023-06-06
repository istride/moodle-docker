FROM docker.io/bitnami/moodle:4.0
RUN apt-get update --yes --quiet && \
    apt-get install curl
COPY plugins.txt /staging/
RUN cd /staging && \
    while read -r in out checksum install_dir; do \
      curl -SsLf $in -o $out && \
      echo $checksum $out | sha256sum -c && \
      tar -xf $out && \
      mv $(basename -s .tar.gz $out) $install_dir && \
      chown -R daemon:root $install_dir; \
    done < plugins.txt && \
    cd / && \
    rm -rf /staging
RUN apt-get autoremove --purge -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives
COPY defaults.php /opt/bitnami/moodle/local/defaults.php
