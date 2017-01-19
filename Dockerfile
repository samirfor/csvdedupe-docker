FROM python:3.4-alpine

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                ca-certificates \
                gcc \
                g++ \
                git

WORKDIR "/csvdedupe"
ENV PIP_INSTALL="pip install --verbose --no-cache-dir --disable-pip-version-check"
ENV CSVDEDUPE_VERSION="cbb5e8bf163f2b078cb8c264a7174235dfa053cd"

RUN set -ex \
        && ln -s /usr/include/locale.h /usr/include/xlocale.h \
        && ${PIP_INSTALL} numpy==1.11 \
        && ${PIP_INSTALL} git+https://github.com/samirfor/csvdedupe.git@${CSVDEDUPE_VERSION} \
        && apk del \
                git

ENTRYPOINT ["csvdedupe"]
CMD ["--help"]
