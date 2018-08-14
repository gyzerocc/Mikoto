#
# Be sure to run `pod lib lint Mikoto.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Mikoto'
  s.version          = '0.1.0'
  s.summary          = 'Mikoto: some base components.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '这是一个用于iOS开发的常用基础组件库。包含常用的全局变量、拓展、正则表达式验证、提示等等。'

  s.homepage         = 'https://github.com/gyzerocc/Mikoto'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gyzerocc' => '184453324@qq.com' }
  s.source           = { :git => 'https://github.com/gyzerocc/Mikoto.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
	core.dependency 'SVProgressHUD', '~> 2.2.5'
	core.dependency 'Toast', '~> 4.0.0'
	core.source_files = 'Mikoto/Classes/Core/**/*'
  end
  
  # s.resource_bundles = {
  #   'Mikoto' => ['Mikoto/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
