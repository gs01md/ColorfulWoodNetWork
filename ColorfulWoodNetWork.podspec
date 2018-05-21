

Pod::Spec.new do |s|

  s.name         = "ColorfulWoodNetWork"
  s.version      = "0.0.0.2"
  s.summary      = "网络封装"

  s.homepage     = "https://github.com/gs01md"

  s.license      = "MIT"

  s.author       = { "ColorfulWood" => "103377808@qq.com" }

  s.source       = { :git => "https://github.com/gs01md/ColorfulWoodNetWork.git", :tag => "#{s.version}" }

  s.source_files = "ColorfulWoodNetWork/ColorfulWoodNetWork/CocoapodFiles/*"

  s.platform     = :ios, "8.2"

  s.frameworks   = 'Foundation'

  s.dependency    'JSONModel',          '~> 1.7.0'
  s.dependency    'AFNetworking',       '~> 3.2.1'
  s.dependency    'RealReachability',   '~> 1.2.0'
  s.dependency    'ColorfulWoodSystem'

end
