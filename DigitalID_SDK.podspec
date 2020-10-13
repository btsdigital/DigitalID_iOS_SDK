Pod::Spec.new do |s|
  s.name                = 'DigitalID_SDK'
  s.version             = '1.0.2'
  s.summary             = 'DigitalID SDK'
  s.description         = <<-DESC
DigitalID SDK
                       DESC
  s.homepage            = 'https://digital-id.kz'
  s.author              = { 'DigitalID' => 'almas.adilbek@btsdigital.kz' }
  s.source              = { :git => 'https://github.com/btsdigital/DigitalID_iOS_SDK.git', :tag => "v#{spec.version}" }
  s.source_files        = 'DigitalID_SDK/*.{h,m}'
  s.dependency          = 'DigitalIDZoomAuthenticationCordovaPlugin'

  s.ios.deployment_target = '11.0'
end