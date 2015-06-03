#
# Be sure to run `pod lib lint ObjCMixin.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ObjCMixin"
  s.version          = "0.1.0"
  s.summary          = "Add @module and @mixin to Object-C."
  s.description      = <<-DESC
                       This pod provides several macros to implement mixins in Object-C.
                       DESC
  s.homepage         = "https://github.com/huandu/ObjCMixin"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Huan Du" => "i@huandu.me" }
  s.source           = { :git => "https://github.com/huandu/ObjCMixin.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  #s.platform     = :ios, '7.0'
  s.requires_arc = false

  s.source_files = 'Pod/Classes/**/*'
  #s.resource_bundles = {
  #  'ObjCMixin' => ['Pod/Assets/*.png']
  #}

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
