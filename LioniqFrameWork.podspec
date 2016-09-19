Pod::Spec.new do |s|
  s.name         = 'LioniqFrameWork'
  s.version      = '0.1.0'
  s.summary      = 'LioniqFrameWork iOS SDK'
  s.description  = <<-DESC
                   快速创建电商平台的商城、购物车的framework
                   DESC
  s.homepage     = 'https://github.com/twairball/lioniq-ios'
  s.license      = { :type => 'MIT' }
  s.author       = { 'ontheltall.com' => 'dev@ontheltall.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'git@github.com:twairball/lioniq-ios.git', :tag => s.version }
  s.requires_arc = true
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.resource = 'lib/*.framework'
  end
end

