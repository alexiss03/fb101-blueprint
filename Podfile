# Uncomment this line to define a global platform for your project
platform :ios, '8.0'

target 'Nymeria' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'Rollout.io', '~> 1.0.0'
  pod 'SwiftyJSON'
  pod 'iCarousel'
  pod 'Alamofire'
  pod 'RESideMenu'
  pod 'NAExpandableTableController'  
  pod 'IQKeyboardManager'
  pod 'PDFGenerator'
  pod 'Google/Analytics'
  pod "iCarousel"
#  pod 'Charts', '~> 2.3.0'

  # Pods for Nymeria

  target 'NymeriaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NymeriaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
end
end
end
