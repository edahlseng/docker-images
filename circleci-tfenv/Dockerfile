ARG debianVersion
FROM circleci/buildpack-deps:${debianVersion} as builder

RUN git clone --branch v1.0.2 --depth 1 https://github.com/tfutils/tfenv.git ~/.tfenv \
    && rm -rf ~/.tfenv/.git \
    && sudo ln -s ~/.tfenv/bin/* /usr/local/bin
