Pod::Spec.new do |s|
  s.name             = 'Networking'
  s.version          = '0.0.1'
  s.summary          = 'A short description of Networking.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
                   
  s.homepage         = 'https://github.com/justinetabin/Networking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'justinetabin' => 'justinetabin@gmail.com' }
  s.source           = { :git => 'https://github.com/justinetabin/Networking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'Networking/Module/**/*.{swift}'
  s.dependency 'Alamofire', '5.2.2'
end
