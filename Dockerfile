FROM samirfor/dedupe-docker

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                ca-certificates \
                gcc \
                g++ \
        && pip3 install --no-cache-dir --disable-pip-version-check csvdedupe
        
ENTRYPOINT ["csvdedupe"]
