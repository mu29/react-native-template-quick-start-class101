#!/bin/bash

while [ $# -gt 0 ]; do
  if [[ $1 == *"--"* ]]; then
    param="${1/--/}"
    declare $param="$2"
  fi
  shift
done

if [ -z "$name" ] || [ -z "$bundle" ] || [ -z "$password" ]; then
  echo "사용법: sh create-app.sh --name \"[앱 이름]\" --bundle \"[앱 아이디]\" --password \"[배포 비밀번호]\""
	exit 1
fi

npx react-native@0.63.4 init TempApp --template https://github.com/mu29/react-native-template-quick-start-class101
cd TempApp

npx react-native-rename@2.9.0 "$name" -b "$bundle"
sed -i '' 's/\(REACT_NATIVE_PROJECT_NAME=\).*/\1'$name'/g' .env
sed -i '' 's/\(APP_IDENTIFIER=\).*/\1'$bundle'/g' .env
sed -i '' 's/\(KEYSTORE_PASSWORD=\).*/\1'$password'/g' .env
sed -i '' 's/\(PRODUCT_BUNDLE_IDENTIFIER = \).*/\1"'"$bundle"'";/g' ios/$name.xcodeproj/project.pbxproj

cd ..
mv TempApp $name

echo $name
cd $name
npx pod-install
