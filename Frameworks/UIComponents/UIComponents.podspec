Pod::Spec.new do |s|

  s.name             = "UIComponents"
  s.version          = "0.0.1"
  s.summary          = "totally awesome stuff"

  s.description      = <<-DESC
                         more details about the totally awesome stuff, if only it worked :(
                       DESC

  s.homepage         = "https://awesomestuff.com"
  s.license          = 'MIT'
  s.author           = { "Me" => "me@awesomestuff.com" }
  s.source           = { :git => "https://awesome.com/awesome/my-custom-pod.git", :tag => s.version.to_s }

  s.platform     = :ios, '17.0'

  s.source_files = '**/*.{swift,m,xib,storyboard}'
  s.resources = [
    "Resources/*.{strings,xcassets,stringsdict}",
    "Resources/**/*.{strings,stringsdicts}"
  ]

  s.dependency 'R.swift'
  s.dependency 'SnapKit'
                                                                                           

end
