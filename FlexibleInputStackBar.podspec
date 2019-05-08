Pod::Spec.new do |s|
  s.name         = "FlexibleInputStackBar"
  s.version      = "0.0.4"
  s.summary      = "Customizable input accessory view"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/kzumu/FlexibleInputStackBar"
  s.author       = { "SOMTD" => "kazu.devapp[at]gmail.com" }
  s.source       = { :git => "https://github.com/kzumu/FlexibleInputStackBar.git", :tag => spec.version }
  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.source_files = 'FlexibleInputStackBar/**/*.{swift}'
  s.frameworks   = 'UIKit'
end
