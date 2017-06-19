Pod::Spec.new do |s|
  s.name             = "ReusableKit"
  s.version          = "1.2.0"
  s.summary          = "Generic reusables for Cocoa."
  s.homepage         = "https://github.com/devxoul/ReusableKit"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/ReusableKit.git",
                         :tag => s.version.to_s }
  s.frameworks       = 'UIKit', 'Foundation'
  s.requires_arc     = true

  s.ios.deployment_target = "8.0"

  s.subspec "Core" do |ss|
    ss.source_files = "Sources/ReusableKit/*.swift"
  end

  s.subspec "RxSwift" do |ss|
    ss.source_files = "Sources/RxReusableKit/*.swift"
    ss.dependency "ReusableKit/Core"
    ss.dependency "RxSwift", ">= 3.4"
    ss.dependency "RxCocoa", ">= 3.4"
  end
end
