#/bin/bash -e

#ENV
dockerImageName=$1
dockerTagVersion=$2
jenkinsWorkspace=$3
dockerRegistry=$4
echo ""
echo "dockerImageName" $dockerImageName
echo "dockerTagVersion" $dockerTagVersion
echo $jenkinsWorkspace
echo "dockerRegistry" $dockerRegistry
echo ""
aws ecr list-images --repository-name=pao/nginx
