# Rakefile
include Rake::DSL
require 'bundler'
Bundler.require

Wox::Tasks.create :info_plist => 'vkmessenger/vkmessenger-Info.plist', :sdk => 'iphoneos', :configuration => 'Release' do
  build :debug, :configuration => 'Debug'

  build :release, :developer_certificate => 'iPhone Distribution: Flexis ZAO' do
    ipa :app_store, :provisioning_profile => 'App Store'
    ipa :adhoc, :provisioning_profile => '2BE7349A-262D-406B-8EEE-E2F3A8C9D1F0' do
      testflight :publish, :api_token => '08b23486f570e3988c6e5633c2c0a25b_MzUwMjgzMjAxMi0wMy0wOSAxMDoyNjo1Mi44NTM5MTA',
                           :team_token => 'dd455e530f47e38f634c5eee987b8a11_NzEyOTUyMDEyLTAzLTE0IDA3OjA1OjA0Ljc3MTYwNg',
                           :notes => proc { File.read("CHANGELOG") },
                           :distribution_lists => %w[All],
                           :notify => true

    end
  end
end
