# frozen_string_literal: true

require_relative "lib/omniauth-vatsimsso/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-vatsimsso"
  spec.version = Omniauth::Vatsimsso::VERSION
  spec.authors = ["V.Polostyanoy"]
  spec.email = ["polostyanoy@gmail.com"]

  spec.summary = "OmniAuth strategy for VATSIM OAuth2."
  spec.description = "OmniAuth strategy for VATSIM OAuth2."
  spec.homepage = "https://github.com/Valerapol/omniauth-vatsimsso"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.add_dependency 'omniauth', '~> 2.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.8'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

end