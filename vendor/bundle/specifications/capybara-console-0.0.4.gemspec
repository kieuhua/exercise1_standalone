# -*- encoding: utf-8 -*-
# stub: capybara-console 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "capybara-console".freeze
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Victor Bilyk".freeze]
  s.date = "2013-09-05"
  s.description = "Adds the rake task to launch capybara console for your Rails project.".freeze
  s.email = ["victorbilyk@gmail.com".freeze]
  s.homepage = "https://github.com/vspy/capybara-console".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.13".freeze
  s.summary = "Capybara console for rails".freeze

  s.installed_by_version = "2.6.13" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<capybara>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.0"])
      s.add_dependency(%q<capybara>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.0"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
  end
end
