require_relative 'lib/pgpool_no_load_balance/version'

Gem::Specification.new do |spec|
  spec.name          = "pgpool_no_load_balance"
  spec.version       = PgpoolNoLoadBalance::VERSION
  spec.authors       = ["elengine"]
  spec.email         = ["info.el.engine@gmail.com"]

  spec.summary       = "Disable load balancing by Pgpool-II for Rails apps."
  spec.homepage      = "https://github.com/elengine/pgpool_no_load_balance"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.2.2")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 5.2.0"
end
