lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'

Gem::Specification.new do |spec|
  spec.name          = "nth_weekday"
  spec.version       = File.read(File.expand_path('VERSION', __dir__)).strip
  spec.authors       = ["Yusuke Higasa"]
  spec.email         = ["higasa@studio-higasa.com"]

  spec.summary       = %q{Get dates like "3rd Wednesday" or "last Friday" from any given year and month}
  spec.description   = %q{A lightweight Ruby library to get dates like "3rd Wednesday" or "last Friday" from any given year and month. Rails-compatible and dependency-free.}
  spec.homepage      = "https://github.com/yusukehigasa/nth_weekday"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.3.0"

  # Specify which files should be added to the gem when it is released.
  spec.files         = Dir.glob("{lib,examples}/**/*") + %w[LICENSE README.md VERSION Rakefile]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/yusukehigasa/nth_weekday",
    "changelog_uri" => "https://github.com/yusukehigasa/nth_weekday/blob/main/CHANGELOG.md",
    "bug_tracker_uri" => "https://github.com/yusukehigasa/nth_weekday/issues",
    "rubygems_mfa_required" => "true"
  }

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
