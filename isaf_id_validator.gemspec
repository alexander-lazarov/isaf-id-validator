Gem::Specification.new do |s|
  s.name = 'isaf_id_validator'
  s.version = '0.0.1'
  s.authors = ['Alexander Lazarov']
  s.description = 'An ISAF ID validator for Rails 4. See homepage for details: https://github.com/alexander-lazarov/isaf_id_validator'
  s.email = 'alexander.lazaroff@gmail.com'
  s.extra_rdoc_files = [ 'LICENSE' ]
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")

  s.homepage = 'https://github.com/alexander-lazarov/isaf_id_validator'
  s.require_paths = %w(lib)
  s.summary = 'An ISAF ID validator for Rails 4.'

  s.add_dependency('activemodel', '>= 0')
  s.add_development_dependency('rubysl', '~> 2.0') if RUBY_ENGINE == 'rbx'

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '>= 0')
end
