FROM antora/antora:2.3.4

RUN chmod 755 entrypoint.sh

COPY --chown $USER:$USER ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
