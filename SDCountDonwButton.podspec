Pod::Spec.new do |s|

  s.name         = "SDCountDonwButton"
  s.version      = "1.0.0"
  s.summary      = "A subclass of UIButton can countdown. customized chaningState's string or completion content.
  s.description  = "A subclass of UIButton can countdown. customized chaningState's string or completion content. you can create it with code or xib, it's ok. because of it's subclasss of UIButton, you can do it more"
                 
  s.homepage     = "https://github.com/momo13014/SDCountdown"
  s.author       = { "Frank Shen" => "momo13014@gmail.com" }
  s.requires_acr = true
  s.ios.deployment_target = '7.0'

  s.source       = { :git => "https://github.com/momo13014/SDCountdown.git"}
  s.source_files  = 'Classes', 'SDCountDownButton/SDCountDonwButton/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.public_header_files = 'SDCountDownButton/SDCountDownButton/SDCountDownButton.h'
  s.frameworks    = 'UIKit'
  s.requires_arc = true

end
