# frozen_string_literal: true

source "https://rubygems.org"

gem "fastlane", "~> 2.208"
gem 'cocoapods', '~> 1.15.0'
gem 'xcov', '~> 1.8'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
