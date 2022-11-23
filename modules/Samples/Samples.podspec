Pod::Spec.new do |spec|
  spec.name                  = 'Samples'
  spec.version               = '0.0.1'
  spec.license               = { :type => ' Apache-2.0' }
  spec.authors               = 'TW-Smart-CoE'
  spec.homepage              = 'https://github.com/TW-Smart-CoE/ARK-iOS'
  spec.social_media_url      = 'https://github.com/TW-Smart-CoE/ARK-iOS'
  spec.summary               = 'Samples module of ARK'
  spec.source                = { :git => 'https://github.com/TW-Smart-CoE/ARK-iOS.git', :tag => '#{s.version}' }
  spec.module_name           = 'Samples'
  spec.swift_version         = '5.0'
  spec.ios.deployment_target = '14.0'
  spec.source_files          = 'Samples/**/*.swift'
  spec.framework             = 'Foundation'
  spec.test_spec 'SamplesTests' do |test_spec|
    test_spec.source_files = 'SamplesTests/*.swift'
  end
  
  spec.dependency 'Alamofire', '~> 5.6'
  spec.dependency 'Core'
end
