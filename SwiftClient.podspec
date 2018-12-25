Pod::Spec.new do |s|
  s.name = 'SwiftClient'
  s.version = '1.0.1'
  s.license = 'MIT'
  s.summary = 'A simple API client implementation in Swift for the ARK Blockchain'
  s.homepage = 'https://github.com/ArkEcosystem/swift-client'
  s.authors = { 'Ark Ecosystem' => 'info@ark.io' }
  s.source = { :git => 'https://github.com/ArkEcosystem/swift-client.git', :tag => s.version }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.dependency 'Alamofire', '4.7.3'

  s.source_files = 'Client/Client/**/*.swift'
end
