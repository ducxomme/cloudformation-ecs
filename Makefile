
createEcr:
	aws cloudformation create-stack \
	--stack-name ecr-repository-httpd \
	--template-body file://cloudformation/ECRRepository.yml \
	--parameter \
	ParameterKey=repositoryName,ParameterValue=application \
	--region us-east-2

docker-login:
	aws --region us-east-2 ecr get-login-password | docker login --username AWS --password-stdin 445386517627.dkr.ecr.us-east-2.amazonaws.com

docker-build:
	docker build -t 445386517627.dkr.ecr.us-east-2.amazonaws.com/httpd-web:v1 .
	
docker-tag:
	docker tag httpd-centos:v1 445386517627.dkr.ecr.us-east-2.amazonaws.com/httpd-web:v1

docker-push:
	docker push 445386517627.dkr.ecr.us-east-2.amazonaws.com/httpd-web:v1

createEcs:
	aws cloudformation create-stack \
	--stack-name ecs-cluster \
	--template-body file://cloudformation/ECSCluster.yml \
	--region us-east-2

createVPC:
	aws cloudformation create-stack \
	--stack-name dev-httpd-vpc \
	--template-body file://cloudformation/VPC.yml \
	--region us-east-2

createService:
	aws cloudformation create-stack \
	--stack-name ecs-services \
	--capabilities CAPABILITY_NAMED_IAM \
	--template-body file://cloudformation/ECSService.yml \
	--region us-east-2