Pod::Spec.new do |s|
  s.name             = "GenericReusable"
  s.version          = "0.2.1"
  s.summary          = "Generic reusables for Cocoa."
  s.homepage         = "https://github.com/devxoul/GenericReusable"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/GenericReusable.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/*.swift"
  s.requires_arc     = true

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"

  s.deprecated_in_favor_of = 'ReusableKit'
end
