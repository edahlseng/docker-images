terraformVersions=0.11.8 0.11.9 0.11.10 0.11.11

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
