cask :v1 => 'intellij-idea' do
  version '14.1'
  sha256 '559480f8908719ebc5d34c6da2ba0b3bdc611b86f8ccc4f320bb8b16f78feeb8'

  url "http://download.jetbrains.com/idea/ideaIU-#{version}.dmg"
  name 'IntelliJ IDEA'
  homepage 'https://www.jetbrains.com/idea/'
  license :commercial

  app 'IntelliJ IDEA 14.app'

  zap :delete => [
                  '~/Library/Application Support/IntelliJIdea14',
                  '~/Library/Preferences/IntelliJIdea14',
                 ]

  caveats <<-EOS.undent
    #{token} requires Java 6 like any other IntelliJ-based IDE.
    You can install it with

      brew cask install caskroom/homebrew-versions/java6

    The vendor (JetBrains) doesn't support newer versions of Java (yet)
    due to several critical issues, see details at
    https://intellij-support.jetbrains.com/entries/27854363

    To use existing newer Java at your own risk,
    add JVMVersion=1.6+ to ~/Library/Preferences/IntelliJIdea14/idea.properties
  EOS
end
