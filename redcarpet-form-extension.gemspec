# frozen_string_literal: true

require_relative 'lib/redcarpet/form/extension/version'

Gem::Specification.new do |spec|
  spec.name          = 'redcarpet-form-extension'
  spec.version       = Redcarpet::Form::Extension::VERSION
  spec.authors       = ['Sofia Sousa']
  spec.email         = ['csofiamsousa@gmail.com']

  spec.summary       = 'A Redcarpet extension with a custom HTML render to handle custom Markdown rules for tags like inputs and textareas'
  spec.description   = 'A Redcarpet extension with a custom HTML render to handle custom Markdown rules for tags like inputs and textareas'
  spec.homepage      = 'https://github.com/SofiaSousa/redcarpet-form-extension'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.0')

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/SofiaSousa/redcarpet-form-extension'
  spec.metadata['changelog_uri'] = 'https://github.com/SofiaSousa/redcarpet-form-extension'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'loofah', '~> 2.24.0'
  spec.add_dependency 'redcarpet', '~> 3.6.1'
end
