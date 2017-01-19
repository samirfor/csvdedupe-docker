FROM python:3.4-alpine

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                ca-certificates \
                gcc \
                g++ \
                git

WORKDIR "/csvdedupe"
ENV PIP_INSTALL="pip install --verbose --no-cache-dir --disable-pip-version-check"
ENV CSVDEDUPE_VERSION="659bee4d89fc5c0c2b8b614c0760ac24ad88dc89"

RUN set -ex \
        && ${PIP_INSTALL} numpy==1.11 \
        && ${PIP_INSTALL} git+https://github.com/samirfor/csvdedupe.git@${CSVDEDUPE_VERSION} \
        && apk del \
                git

ENTRYPOINT ["csvdedupe"]
CMD ["--help"]
