Pod::Spec.new do |s|
  s.name    = 'JuLayout'
  s.version = '1.0'
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

 # s.source_files  =  "JuLayout/OCLayout/*.{h,m}"

  s.subspec 'Core' do |m|

        m.subspec 'JuLayout' do |n|
             n.source_files = 'Source/OCLayout/*.{h,m}'
        end

        m.subspec 'JusLayout' do |n|
            n.source_files = 'Source/SwiftLayout/*.swift'
        end

      end

end
