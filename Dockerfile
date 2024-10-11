# Copyright (c) 2024 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2024 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-microsocks> for details.

ARG DEBIAN_VERSION=stable-slim
FROM ${DEBIAN_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
    apt-get update; \
    apt-get install -y --fix-missing --no-install-recommends \
      microsocks; \
    apt-get clean -y; apt-get clean -y; apt-get autoclean -y; rm -r /var/lib/apt/lists/*

# See: <https://github.com/rofl0r/microsocks?tab=readme-ov-file#command-line-options>
CMD /usr/bin/microsocks -1 -q -i 0.0.0.0 -p 1080 -u ${MICROSOCKS_USERNAME} -P ${MICROSOCKS_PASSWORD} -w 10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
