# -*- encoding: utf-8 -*-
# stub: bootstrap_forms 4.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap_forms".freeze
  s.version = "4.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Seth Vargo".freeze]
  s.date = "2013-08-22"
  s.description = "Bootstrap Forms makes Twitter's Bootstrap on Rails easy to use by creating helpful form builders that minimize markup in your views.".freeze
  s.email = "sethvargo@gmail.com".freeze
  s.homepage = "https://github.com/sethvargo/bootstrap_forms".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Bootstrap Forms makes Twitter's Bootstrap on Rails easy!".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 2.13"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 3.2"])
      s.add_development_dependency(%q<country_select>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<fuubar>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.13"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rails>.freeze, ["~> 3.2"])
      s.add_dependency(%q<country_select>.freeze, ["~> 1.1"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<fuubar>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 2.13"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, ["~> 3.2"])
    s.add_dependency(%q<country_select>.freeze, ["~> 1.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<fuubar>.freeze, [">= 0"])
  end
end
