terraformVersions=0.11.11 0.11.12 0.11.13 0.11.14 0.12.0 0.12.1 0.12.2 0.12.3 0.12.4 0.12.5 0.12.6 0.12.7 0.12.8 0.12.9 0.12.10 0.12.11 0.12.12 0.12.13 0.12.14 0.12.15 0.12.16 0.12.17 0.12.18 0.12.19 0.12.20 

default: push

$(addprefix build-terraform-,$(terraformVersions)): build-terraform-%:
	docker build --build-arg terraformVersion=$* --tag edahlseng/terraform:$*-stretch terraform

$(addprefix push-terraform-,$(terraformVersions)): push-terraform-%: build-terraform-%
	docker push edahlseng/terraform:$*-stretch

$(addprefix build-circleci-terraform-,$(terraformVersions)): build-circleci-terraform-%: build-terraform-%
	docker build --build-arg terraformVersion=$* --tag edahlseng/circleci-terraform:$*-stretch circleci-terraform

$(addprefix push-circleci-terraform-,$(terraformVersions)): push-circleci-terraform-%: build-circleci-terraform-%
	docker push edahlseng/circleci-terraform:$*-stretch

push: $(addprefix push-terraform-,$(terraformVersions)) $(addprefix push-circleci-terraform-,$(terraformVersions))
