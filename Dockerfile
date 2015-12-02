FROM meteorhacks/meteord:base

RUN bash $METEORD_DIR/lib/install_meteor.sh

WORKDIR /app
COPY build.sh /opt/build.sh

# Add the bare minimum to be recognised as an app
ONBUILD ADD .meteor/release /app/.meteor/release
ONBUILD ADD .meteor/packages /app/.meteor/packages
ONBUILD RUN meteor list-platforms

ENTRYPOINT ["bash", "/opt/build.sh"]
