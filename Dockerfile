FROM samirfor/dedupe-docker

ENV CSVDEDUPE_VERSION="cbb5e8bf163f2b078cb8c264a7174235dfa053cd"

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
                ca-certificates \
                gcc \
                g++ \
		git

RUN set -ex \
	&& git clone --depth=50 --branch=master https://github.com/datamade/csvdedupe.git datamade/csvdedupe \
	&& cd datamade/csvdedupe \
	&& git checkout ${CSVDEDUPE_VERSION}

WORKDIR "datamade/csvdedupe"

RUN set -ex \
        && pip3 install --no-cache-dir --disable-pip-version-check -r requirements-test.txt

RUN set -ex \
        && python setup.py install

ENTRYPOINT ["csvdedupe"]
CMD ["--help"]
