ARG FROM_BASE=${DOCKER_REGISTRY:-ubuntu-s2.home:5000/}${CONTAINER_OS:-alpine}/nginx-base/${NGINX_VERSION:-1.20.1}:${BASE_TAG:-latest}
FROM $FROM_BASE

# name and version of this docker image
ARG CONTAINER_NAME=php5
# Specify CBF version to use with our configuration and customizations
ARG CBF_VERSION

# include our project files
COPY build Dockerfile /tmp/

# set to non zero for the framework to show verbose action scripts
#    (0:default, 1:trace & do not cleanup; 2:continue after errors)
ENV DEBUG_TRACE=0


# php version being bundled in this docker image
ARG PHP5_VERSION=5.6.40-r0
LABEL version.php=$PHP5_VERSION 


# build content
RUN set -o verbose \
    && chmod u+rwx /tmp/build.sh \
    && /tmp/build.sh "$CONTAINER_NAME" "$DEBUG_TRACE" "$TZ" \
    && ([ "$DEBUG_TRACE" != 0 ] || rm -rf /tmp/*) 


ENTRYPOINT [ "docker-entrypoint.sh" ]
#CMD ["$CONTAINER_NAME"]
CMD ["php5"]
