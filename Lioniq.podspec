Pod::Spec.new do |s|
  s.name         = 'Lioniq'
  s.version      = '0.2.0'
  s.summary      = 'LionIQ iOS SDK'
  s.description  = <<-DESC
                   移动电商APP插件，让你今天就可以完成电商功能。
                   LionIQ 插件包含现有商城首页模版，在任何 APP 只需要几行代码就可以开始显示商城首页。
                  运营、推广团队仅需要通过后台设置产品信息及上传图片，就可以马上通过 LionIQ 插件在你的 APP 显示。
                   DESC
  s.homepage     = 'https://github.com/lioniq/lioniq-ios'
  s.license      = { :type => 'COMMERCIAL' }
  s.author       = { 'twairball' => 'dev@onthetall.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/lioniq/lioniq-ios.git', :tag => s.version }
  s.requires_arc = true
  s.default_subspec = 'lib'

  s.subspec 'lib' do |lib|
    lib.resource = 'lib/*.framework'
  end
end

