#!/bin/bash

# dock autohide and configs
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -float 1.0
defaults write com.apple.dock mineffect -string "genie"
# dock instant show without much delay
defaults write com.apple.dock autohide-time-modifier -float 0.7
killall Dock
# finder settings
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# control center icons
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true

# allow key repeat
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
# https://mac-key-repeat.zaymon.dev/

# disable press and hold
defaults delete -g ApplePressAndHoldEnabled

# really quit finder when cmd+q
defaults write com.apple.finder QuitMenuItem -bool YES
