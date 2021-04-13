Pod::Spec.new do |s|
  s.name                = 'DigitalID_SDK'
  s.version             = '1.1.1'
  s.summary             = 'DigitalID SDK for partners'
  s.description         = <<-DESC
DigitalID SDK
                       DESC
  s.homepage            = 'https://digital-id.kz'
  s.license             = 'MIT'
  s.author              = { 'DigitalID' => 'almas.adilbek@btsdigital.kz' }
  s.source              = { :git => 'https://github.com/btsdigital/DigitalID_iOS_SDK.git', :tag => "v#{s.version}" }
  s.source_files        = 'DigitalID_SDK/*.{h,m}'
  s.dependency          'DigitalIDZoomAuthenticationCordovaPlugin', '~> 0.2.0'
  s.dependency          'Cordova'
  s.user_target_xcconfig  = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig   = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.ios.deployment_target = '11.0'
end
