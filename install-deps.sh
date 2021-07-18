touch ~/.zshrc

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Node.js
brew install node@14

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

sdkmanager "platforms;android-29" "build-tools;29.0.3" "add-ons;addon-google_apis-google-24"

# iOS
brew install cocoapods@1.10.1

# Additional tools
python -mwebbrowser https://developer.android.com/studio
python -mwebbrowser https://apps.apple.com/kr/app/xcode/id497799835

# Config
ln -s $(which node) /usr/local/bin/node
