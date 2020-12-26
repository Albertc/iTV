# -*- encoding: utf-8 -*-
# stub: json_matchers 0.11.1 ruby lib

Gem::Specification.new do |s|
  s.name = "json_matchers".freeze
  s.version = "0.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sean Doyle".freeze]
  s.date = "2019-07-19"
  s.description = "Validate your Rails JSON API's JSON".freeze
  s.email = ["sean.p.doyle24@gmail.com".freeze]
  s.homepage = "https://github.com/thoughtbot/json_matchers".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Validate your Rails JSON API's JSON".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<json_schema>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 2.0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<factory_bot>.freeze, [">= 4.8"])
    s.add_development_dependency(%q<activesupport>.freeze, [">= 0"])
  else
    s.add_dependency(%q<json_schema>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<factory_bot>.freeze, [">= 4.8"])
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
  end
end
