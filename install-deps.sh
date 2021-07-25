#!/bin/bash

touch ~/.zshrc

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Node.js
brew install node@14

ln -s $(which node) /usr/local/bin/node

# Watchman
brew install watchman

# Android
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8

echo 'export PATH="/usr/local/opt/node@14/bin:$PATH"' >> ~/.zshrc
echo 'export JAVA_HOME=$(/usr/libexec/java_home)' >> ~/.zshrc
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.zshrc

source ~/.zshrc

brew install --cask android-sdk

echo 'export ANDROID_HOME=/usr/local/share/android-sdk' >> ~/.zshrc
echo 'export ANDROID_SDK_ROOT=/usr/local/share/android-sdk' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/emulator' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/tools/bin' >> ~/.zshrc
echo 'export PATH=$PATH:$ANDROID_HOME/platform-tools' >> ~/.zshrc

source ~/.zshrc

touch ~/.android/repositories.cfg
sdkmanager "platforms;android-29" "build-tools;29.0.3" "add-ons;addon-google_apis-google-24"
sdkmanager "system-images;android-29;google_apis_playstore;x86"
sdkmanager --licenses
echo "no" | avdmanager --verbose create avd --force --name "test" --package "system-images;android-29;google_apis_playstore;x86" --tag "google_apis_playstore" --abi "x86" --device pixel

# iOS
brew install cocoapods

# Additional tools
python -mwebbrowser https://developer.android.com/studio
python -mwebbrowser https://apps.apple.com/kr/app/xcode/id497799835
