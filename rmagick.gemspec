require 'date'
require 'English'
require './lib/rmagick/version'

Gem::Specification.new do |s|
  s.name = 'rmagick'
  s.version = Magick::VERSION
  s.date = Date.today.to_s
  s.summary = 'Ruby binding to ImageMagick'
  s.description = 'RMagick is an interface between Ruby and ImageMagick.'
  s.authors = ['Tim Hunter', 'Omer Bar-or', 'Benjamin Thomas', 'Moncef Maiza']
  s.email = 'github@benjaminfleischer.com'
  s.homepage = 'https://github.com/rmagick/rmagick'
  s.license = 'MIT'

  tracked_files = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  file_exclusion_regex = %r{(\Alib/rvg/to_c.rb)}
  files         = tracked_files.reject { |file| file[file_exclusion_regex] }
  test_files    = files.grep(%r{^(test|spec|features)/})
  executables   = files.grep(%r{^bin/}).map { |f| File.basename(f) }

  s.files                       = files
  s.test_files                  = test_files
  s.executables                 = executables
  s.require_paths << 'ext' << 'deprecated'

  s.extensions = %w[ext/RMagick/extconf.rb]
  s.required_ruby_version = ">= #{Magick::MIN_RUBY_VERSION}"
  s.requirements << "ImageMagick #{Magick::MIN_IM_VERSION} or later"

  s.add_development_dependency 'rake-compiler', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
  s.add_development_dependency 'rubocop', '~> 0.64.0'
  s.add_development_dependency 'rubocop-rspec', '~> 1.32.0'
  s.add_development_dependency 'simplecov', '~> 0.16.1'
  s.add_development_dependency 'test-unit', '~> 2.5'
end
