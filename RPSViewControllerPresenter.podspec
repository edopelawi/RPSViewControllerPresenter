
Pod::Spec.new do |s|
  s.name             = "RPSViewControllerPresenter"
  s.version          = "0.1.0"
  s.summary          = "A convenience library for presenting UIViewController anywhere."
  s.description      = <<-DESC
                       A convenience library for presenting a new UIViewController as the top
                       presented UIViewController, anywhere from your code.
                       DESC
  s.homepage         = "https://github.com/edopelawi/RPSViewControllerPresenter"
  s.license          = 'MIT'
  s.author           = { "Ricardo Pramana Suranta" => "ricardo.pramana@gmail.com" }
  s.source           = { :git => "https://github.com/edopelawi/RPSViewControllerPresenter.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/edopelawi'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/*'

  s.resource_bundles = {
    'RPSViewControllerPresenter' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'ReactiveCocoa', '~> 2.5'
end
