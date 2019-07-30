Pod::Spec.new do |s|
  s.name    = 'JuLayout'
  s.version = '1.0'
  s.summary = 'JuLayout'
  s.homepage    = 'https://github.com/jutewei/JuLayout'
  s.license = 'MIT'
  s.platform    = :ios
  s.author  = {'Juvid' => 'jutewei@qq.com'}
  s.ios.deployment_target = '9.0'
  s.swift_version = '5'
  s.source  = {:git => 'https://github.com/jutewei/JuLayout.git', :tag => s.version}
  s.source_files  =  "JuLayout/OCLayout/*.{h,m}"
  s.requires_arc = true
  s.frameworks  = 'UIKit', 'AVFoundation'
end