Pod::Spec.new do |s|
  s.name    = 'JuLayout'
  s.version = '1.3.3'
  s.summary = 'JuLayout'
  s.homepage    = 'https://github.com/jutewei/JuLayout'
  s.license = 'MIT'
  s.platform    = :ios
  s.author  = {'Juvid' => 'jutewei@qq.com'}
  s.license          = {
    :type => 'Copyright',
    :text => <<-LICENSE
    © 2016-2021 juvid. All rights reserved.
    LICENSE
  }
  s.platform    = :ios, '9.0'
  s.swift_version = '5'
  s.source  = {:git => 'https://github.com/jutewei/JuLayout.git', :tag => s.version}
  s.requires_arc = true

  s.subspec 'LayoutSwift' do |ss|
    ss.source_files = 'Source/SwiftLayout/*.swift'
  end
 
  s.subspec 'LayoutObjC' do |ss|
    ss.source_files = 'Source/OCLayout/*.{h,m}'
    #ss.dependency  'JuLayout/LayoutSwift'
  end
 
end
