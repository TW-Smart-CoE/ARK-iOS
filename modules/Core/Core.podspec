Pod::Spec.new do |spec|
  spec.name                  = 'Core'
  spec.version               = '0.0.1'
  spec.license               = { :type => ' Apache-2.0' }
  spec.authors               = 'TW-Smart-CoE'
  spec.homepage              = 'https://github.com/TW-Smart-CoE/ARK-iOS'
  spec.social_media_url      = 'https://github.com/TW-Smart-CoE/ARK-iOS'
  spec.summary               = 'Core module of ARK'
  spec.source                = { :git => 'https://github.com/TW-Smart-CoE/ARK-iOS.git', :tag => '#{s.version}' }
  spec.module_name           = 'Core'
  spec.swift_version         = '5.0'
  spec.ios.deployment_target = '14.0'
  spec.source_files          = 'Sources/**/*.swift'
  spec.framework             = 'Foundation'
end
