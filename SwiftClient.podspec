Pod::Spec.new do |s|
  s.name = 'SwiftClient'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'A simple Cryptography Implementation in Swift for the ARK Blockchain'
  s.homepage = 'https://github.com/ArkEcosystem/swift-client'
  s.authors = { 'Brian Faust', 'ItsANameToo'}
  s.source = { :git => 'https://github.com/ArkEcosystem/swift-client.git', :tag => s.version }

  #s.ios.deployment_target = '8.0'
  #s.osx.deployment_target = '10.10'

  s.source_files = 'Client/*.swift'
end