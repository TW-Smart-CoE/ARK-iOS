source 'https://cdn.cocoapods.org/'

platform :ios, '14.0'

use_frameworks!

def modules
  pod 'Core', :path => './modules/Core', :testspecs => ['Tests']
  pod 'UI', :path => './modules/UI'
  pod 'Examples', :path => './modules/Examples'
end

target 'ARK-iOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  
  modules
  pod 'SwiftLint', '~> 0.48'

  # Pods for ARK-iOS

  target 'ARK-iOSTests' do
    inherit! :search_paths
    # Pods for testing
  end

end






