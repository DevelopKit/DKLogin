#
# Be sure to run `pod lib lint DKLogin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DKLogin'
  s.version          = '0.1.0'
  s.summary          = 'Make it easier to build Login Scene'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Make it easier to build Login Scene,it help you write less code.
                       DESC

  s.homepage         = 'https://github.com/DevelopKit/DKLogin'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qiang zhai' => 'zq4950411@163.com' }
  s.source           = { :git => 'https://github.com/DevelopKit/DKLogin.git', :tag => s.version.to_s }
  s.social_media_url = 'http://nstimer.cn'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DKLogin/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DKLogin' => ['DKLogin/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'ReactiveCocoa', '~> 4.2.1'
end
