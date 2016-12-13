Pod::Spec.new do |s|

  s.name         = "SDCountDownButton"
  s.version      = "1.0.2"
  s.summary      = "A subclass of UIButton can countdown. customized chaningState's string or completion content"
  s.description  = "A subclass of UIButton can countdown. customized chaningState's string or completion content. you can create it with code or xib, it's ok. because of it's subclasss of UIButton, you can do it more"
                  
  s.homepage     = "https://github.com/momo13014/SDCountdown"
  s.author       = { "momo13014" => "shendong13014@gmail.com" }
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
  s.license      = 'MIT'
  s.source       = { :git => "https://github.com/momo13014/SDCountdown.git",:tag => s.version.to_s }
  s.source_files  = 'SDCountDonwButton/SDCountDownButton/*.{h,m}'
  
end
