#!/bin/bash

# dock autohide and configs
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -float 1.0
defaults write com.apple.dock mineffect -string "genie"
# dock instant show without delay
defaults write com.apple.dock autohide-delay -float 0 && killall Dock

# finder settings
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# control center icons
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# vim goodies
defaults delete -g ApplePressAndHoldEnabled
