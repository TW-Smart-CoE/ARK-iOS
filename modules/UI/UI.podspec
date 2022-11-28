Pod::Spec.new do |spec|
  spec.name                  = 'UI'
  spec.version               = '0.0.1'
  spec.license               = { :type => ' Apache-2.0' }
  spec.authors               = 'TW-Smart-CoE'
  spec.homepage              = 'https://github.com/TW-Smart-CoE/ARK-iOS'
  spec.social_media_url      = 'https://github.com/TW-Smart-CoE/ARK-iOS'
  spec.summary               = 'Core module of ARK'
  spec.source                = { :git => 'https://github.com/TW-Smart-CoE/ARK-iOS.git', :tag => '#{s.version}' }
  spec.module_name           = 'UI'
  spec.swift_version         = '5.0'
  spec.ios.deployment_target = '14.0'
  spec.source_files          = 'Sources/**/*.swift'
  spec.framework             = 'SwiftUI'
  spec.resource_bundles = {
    'UI' => ['Sources/Image/*.{xcassets}','Sources/Theme/Colors/*.{xcassets}'],
 }
  spec.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*.swift'
  end
end
