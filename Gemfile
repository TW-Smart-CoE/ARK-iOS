# frozen_string_literal: true

source "https://rubygems.org"

gem "fastlane", "~> 2.208"
gem 'cocoapods', '~> 1.11.3'
gem 'xcov', '~> 1.8'
gem 'slather', '~> 2.7'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
