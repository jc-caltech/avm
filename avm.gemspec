require_relative 'lib/avm/version'

Gem::Specification.new do |spec|
  spec.name          = "avm"
  spec.version       = Avm::VERSION
  spec.authors       = ["jc-caltech"]
  spec.email         = ["jcrouch.caltech@gmail.com"]

  spec.summary       = %q{Move avm data logic to gem }
  spec.description   = %q{this gem can be used to .}
  spec.homepage      = "https://github.com/jc-caltech/avm_data"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jc-caltech/avm_data"
  spec.metadata["changelog_uri"] = "https://github.com/jc-caltech/avm_data"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
  `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) || f == "avm-0.1.0.gem" }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency 'exiftool_vendored'
  spec.add_dependency 'open3'

end
