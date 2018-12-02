#/bin/bash -e

#ENV
dockerImageName=$1
dockerTagVersion=$2
jenkinsWorkspace=$3
dockerRegistry=$4

echo "dockerImageName" $dockerImageName
echo "dockerTagVersion" $dockerTagVersion
echo $jenkinsWorkspace
echo "dockerRegistry" $dockerRegistry
