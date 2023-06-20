FROM docker.io/bitnami/moodle:4.2.1
RUN install_packages curl git
RUN git clone --depth 1 https://github.com/dthies/moodle-quizaccess_addreview.git \
                        /opt/bitnami/moodle/mod/quiz/accessrule/addreview && \
    chown -R daemon:root /opt/bitnami/moodle/mod/quiz/accessrule/addreview && \
    chmod -R g+w /opt/bitnami/moodle/mod/quiz/accessrule/addreview
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
RUN apt-get autoremove --purge -y curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives
COPY defaults.php /opt/bitnami/moodle/local/defaults.php
