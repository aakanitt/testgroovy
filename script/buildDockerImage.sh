#/bin/bash -e

#ENV
dockerImageName=$1
dockerTagVersion=$2
jenkinsWorkspace=$3
dockerRegistry=$4
buildFolder=k8s
echo ""
echo "dockerImageName" $dockerImageName
echo "dockerTagVersion" $dockerTagVersion
echo $jenkinsWorkspace
echo "dockerRegistry" $dockerRegistry
echo ""
rm -rf $jenkinsWorkspace/$buildFolder
mkdir -p $jenkinsWorkspace/$buildFolder
cp -r $jenkinsWorkspace/app/* $jenkinsWorkspace/$buildFolder/
cd $jenkinsWorkspace/$buildFolder/
docker build --no-cache -t $dockerImageName:$dockerTagVersion .
echo ""
docker tag $dockerImageName:$dockerTagVersion $dockerRegistry:$dockerTagVersion
echo ""
eval $(aws ecr get-login --no-include-email)
docker push $dockerRegistry:$dockerTagVersion
echo ""
docker images
echo ""
aws ecr list-images --repository-name=pao/nginx
