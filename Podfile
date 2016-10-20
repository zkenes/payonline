# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'Payonline' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Payonline
pod 'Alamofire', '~> 3.0'
pod 'AEXML', '~> 3.0'
pod 'SwiftWebVC'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end
