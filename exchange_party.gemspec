# frozen_string_literal: true

require_relative "lib/exchange_party/version"

Gem::Specification.new do |spec|
  spec.name = "exchange_party"
  spec.version = ExchangeParty::VERSION
  spec.authors = ["Ender Ahmet Yurt"]
  spec.email = ["enderyurt@gmail.com"]

  spec.summary = "Fetch the exchange rates from TCMB"
  spec.description = "Fetch the exchange rates from TCMB and return them as an object."
  spec.homepage = "https://www.enderahmetyurt.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = ""
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
