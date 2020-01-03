#
# Be sure to run `pod lib lint GHWPodDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BaiduAd'
  s.version          = '0.1.0'
  s.summary          = 'Baidu Ad'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/guohongwei719/BinaryToSource'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guohongwei719' => 'guohongwei04441@hellobike.com' }
  s.source           = { :git => 'https://github.com/guohongwei719/BinaryToSource.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.vendored_frameworks = 'Products/*.framework'
  s.resource = 'assets/*.bundle'
  # s.source_files = 'GHWPodDemo/Classes/**/*'
  # s.public_header_files = 'GHWPodDemo/Classes/**/*.h'

  # s.resource_bundles = {
  #   'GHWPodDemo' => ['GHWPodDemo/Assets/*.png']
  # }
# 
  s.frameworks = 'StoreKit', 'SafariServices', 'MessageUI', 'CoreMedia', 'CoreMotion', 'SystemConfiguration', 'CoreLocation', 'CoreTelephony', 'AVFoundation', 'AdSupport'
  s.libraries = "c++"
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }
  # s.dependency 'AFNetworking', '~> 2.3'
end
