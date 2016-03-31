require 'bundler/setup'
Bundler.setup

Dir['lib/*.rb'].each { |file| require_relative "../#{file}" }
