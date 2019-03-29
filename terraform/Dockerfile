FROM debian:stretch as builder
ARG terraformVersion

RUN apt-get update \
	&& apt-get install -y wget unzip

RUN wget https://releases.hashicorp.com/terraform/${terraformVersion}/terraform_${terraformVersion}_linux_amd64.zip \
	&& unzip terraform_${terraformVersion}_linux_amd64.zip \
	&& rm terraform_${terraformVersion}_linux_amd64.zip \
	&& mv terraform /usr/local/bin

FROM debian:stretch as artifact

COPY --from=builder /usr/local/bin /usr/local/bin
