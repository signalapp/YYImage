Pod::Spec.new do |s|
  s.name         = 'YYImage'
  s.summary      = 'Image framework for iOS to display/encode/decode animated WebP, APNG, GIF, and more.'
  s.version      = '1.0.4'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/ibireme/YYImage'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/ibireme/YYImage.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'YYImage/*.{h,m}'
    core.public_header_files = 'YYImage/*.{h}'
    core.libraries = 'z'
    core.frameworks = 'UIKit', 'CoreFoundation', 'QuartzCore', 'ImageIO', 'Accelerate', 'MobileCoreServices'
    # CATALYST TODO: How to include a framework only on *non* catalyst (iOS only) targets?
    # or, for our purposes we can just exclude it altogether since we're not using it
    # core.ios.frameworks = 'AssetLibrary'
  end
  
  s.subspec 'WebP' do |webp|
    webp.dependency 'YYImage/Core'
    webp.ios.vendored_frameworks = 'Vendor/WebP.framework'
  end

end
