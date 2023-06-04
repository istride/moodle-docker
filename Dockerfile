FROM docker.io/bitnami/moodle:4.0
RUN mkdir /staging
WORKDIR /staging
ADD https://github.com/maths/moodle-qbehaviour_adaptivemultipart/archive/refs/tags/v4.3.8.tar.gz adaptivemultipart.tar.gz
ADD https://github.com/maths/moodle-qbehaviour_dfcbmexplicitvaildate/archive/refs/tags/v4.2.2.tar.gz dfcbmexplicitvaildate.tar.gz
ADD https://github.com/maths/moodle-qbehaviour_dfexplicitvaildate/archive/refs/tags/v4.2.2.tar.gz dfexplicitvaildate.tar.gz
ADD https://github.com/maths/moodle-qtype_stack/archive/refs/tags/v4.4.3.tar.gz stack.tar.gz
COPY checksums .
RUN sha256sum --check checksums \
    && tar -xf adaptivemultipart.tar.gz \
    && tar -xf dfcbmexplicitvaildate.tar.gz \
    && tar -xf dfexplicitvaildate.tar.gz \
    && mv moodle-qbehaviour_adaptivemultipart-4.3.8 /opt/bitnami/moodle/question/behaviour/adaptivemultipart \
    && mv moodle-qbehaviour_dfcbmexplicitvaildate-4.2.2 /opt/bitnami/moodle/question/behaviour/dfcbmexplicitvaildate \
    && mv moodle-qbehaviour_dfexplicitvaildate-4.2.2 /opt/bitnami/moodle/question/behaviour/dfexplicitvaildate \
    && tar -xf stack.tar.gz \
    && mv moodle-qtype_stack-4.4.3 /opt/bitnami/moodle/question/type/stack \
    && chown -R daemon:root /opt/bitnami/moodle/question/behaviour/adaptivemultipart \
                            /opt/bitnami/moodle/question/behaviour/dfcbmexplicitvaildate \
                            /opt/bitnami/moodle/question/behaviour/dfexplicitvaildate \
                            /opt/bitnami/moodle/question/type/stack \
    && rm -rf /staging
WORKDIR /
COPY defaults.php /opt/bitnami/moodle/local/defaults.php
