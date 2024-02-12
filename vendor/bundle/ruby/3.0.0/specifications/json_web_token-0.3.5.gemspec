# -*- encoding: utf-8 -*-
# stub: json_web_token 0.3.5 ruby lib

Gem::Specification.new do |s|
  s.name = "json_web_token".freeze
  s.version = "0.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gary Fleshman".freeze]
  s.date = "2017-06-17"
  s.description = "Ruby implementation of the JSON Web Token (JWT) standard, RFC 7519".freeze
  s.email = ["gfleshman@newforge-tech.com".freeze]
  s.homepage = "https://github.com/garyf/json_web_token".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "JSON Web Token (JWT) for Ruby".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<json>.freeze, ["~> 2.1"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3.4"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.14"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<wwtd>.freeze, ["~> 1.3"])
  else
    s.add_dependency(%q<json>.freeze, ["~> 2.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_dependency(%q<pry-byebug>.freeze, ["~> 3.4"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.14"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9"])
    s.add_dependency(%q<wwtd>.freeze, ["~> 1.3"])
  end
end
