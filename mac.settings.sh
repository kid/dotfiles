#!/usr/bin/env bash

# Thanks to Mathias Bynens! https://mths.be/macos

# Sets default iTerm2 profile to eighties dynamic profile
defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "A879712F-6297-42E3-BFFD-9A5664D31470"
# Disable diming inactive split panes
defaults write com.googlecode.iterm2 "DimInactiveSplitPanes" -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleMultitouchTrackpad Clicking -bool true

# Trackpad: 3 fingers to swipe between pages, 4 to swipe between full screen apps
defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Allow key repeat for VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Disable mouse acceleration
defaults write -g com.apple.mouse.scaling -1
