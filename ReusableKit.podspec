Pod::Spec.new do |s|
  s.name             = "ReusableKit"
  s.version          = "1.0.0"
  s.summary          = "Generic reusables for Cocoa."
  s.homepage         = "https://github.com/devxoul/ReusableKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/ReusableKit.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/*.swift"
  s.frameworks       = 'UIKit', 'Foundation'
  s.requires_arc     = true

  s.ios.deployment_target = "8.0"
end
