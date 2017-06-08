#
#  Be sure to run `pod spec lint ETTVideoPlayerSlider.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name        = 'ETTVideoPlayerSlider'

s.version      = '0.2'

s.summary      = 'VideoPlayerSlider with buffer value and play value'

s.homepage    = 'https://github.com/waitwalker/ETTVideoPlayerSlider'

s.license      = 'MIT'

s.authors      = {'waitWalker' => 'waitwalker@163.com'}

s.platform    = :ios, '8.0'

s.source      = {:git => 'https://github.com/waitwalker/ETTVideoPlayerSlider.git', :tag => s.version}

s.source_files = 'ETTVideoPlayerSlider'


s.requires_arc = true

end
