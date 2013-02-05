Pod::Spec.new do |s|
  s.name         = "TheaterBox"
  s.version      = "0.0.1"
  s.summary      = "Working towards a CocoaPod that manages a full screen NSView on a secondary screen or projector. If there is no secondary screen (i.e. you're developing in the train again), you'll get a preview window instead. Double-clicking that window full-screens it on the current screen."
  s.author       = 'halo'
  s.homepage     = "http://github.com/halo/#{s.name}"
  s.license      = { :type => 'MIT', :file => 'MIT-LICENSE' }
  s.source       = { :git => "https://github.com/halo/#{s.name}.git", :tag => s.version.to_s }
  s.source_files = 'Classes'
  s.requires_arc = true
  s.platform     = :osx
end
