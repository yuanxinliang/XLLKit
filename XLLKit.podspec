#
# Be sure to run `pod lib lint XLLKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|

  s.name                    = 'XLLKit'
  s.version                 = '0.1.4'
  s.summary                 = 'Base XLLKit.'
  s.homepage                = 'https://github.com/yuanxinliang/XLLKit'
  s.license                 = 'MIT'
  s.author                  = { 'yuanxinliang' => '306619887@qq.com' }
  s.source                  = { :git => 'https://github.com/yuanxinliang/XLLKit.git', :tag => s.version.to_s }
  s.swift_version           = '5.0'
  s.ios.deployment_target   = '9.0'
  s.requires_arc            = true
  
  
  s.subspec 'Constant' do |ss|
    ss.source_files = 'XLLKit/Classes/Constant'
  end
  
  s.subspec 'Extension' do |ss|
    ss.source_files = 'XLLKit/Classes/Extension'
  end
  
  s.subspec 'Component' do |ss|
    ss.source_files = 'XLLKit/Classes/Component'
    ss.resource     = 'XLLKit/Classes/Component/Resource'
    ss.dependency     'XLLKit/Extension'
    ss.dependency     'XLLKit/Constant'
    ss.dependency     'SDWebImage'
    ss.dependency     'MBProgressHUD'
  end
  
  s.subspec 'Tool' do |ss|
    ss.source_files = 'XLLKit/Classes/Tool'
  end
  
  #s.source_files = 'XLLKit/Classes/**/*'

end
