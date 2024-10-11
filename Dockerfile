# Copyright (c) 2024 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2024 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-microsocks> for details.

ARG DEBIAN_VERSION=stable-slim
FROM debian:${DEBIAN_VERSION}

ARG MICROSOCKS_VERSION=*
ENV DEBIAN_FRONTEND=noninteractive \
    MICROSOCKS_USERNAME=user \
    MICROSOCKS_PASSWORD=pass
RUN set -ex; \
    apt-get update; \
    apt-get install -y --fix-missing --no-install-recommends \
      microsocks=${MICROSOCKS_VERSION}*; \
    apt-get clean -y; apt-get clean -y; apt-get autoclean -y; rm -r /var/lib/apt/lists/*

# See: <https://github.com/rofl0r/microsocks?tab=readme-ov-file#command-line-options>
ENTRYPOINT [ /usr/bin/microsocks ]
CMD [ -1, -i 0.0.0.0, -p 1080, -u ${MICROSOCKS_USERNAME}, -P ${MICROSOCKS_PASSWORD} ]
