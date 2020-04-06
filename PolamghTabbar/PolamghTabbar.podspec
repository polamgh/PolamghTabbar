
Pod::Spec.new do |spec|

  spec.name         = "PolamghTabbar"
  spec.version      = "1.3.1"
  spec.summary      = "tabbar with circel button"
  spec.description  = "This is a tabbar with circel button"
  spec.homepage     = "https://github.com/polamgh/PolamghTabbar"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
    spec.license      = "MIT"
  spec.author             = { "Ali Ghanavati" => "aliali3684@gmail.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/polamgh/PolamghTabbar.git", :tag => "1.0.0" }
  spec.source_files  = "PolamghTabbar/**/*"
  spec.swift_version = '5.0'
    spec.ios.deployment_target  = '8.0'
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  spec.exclude_files = "PolamghTabbar/*.plist"

end
