# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deliver_asap/version'

Gem::Specification.new do |spec|
  spec.name          = 'deliver_asap'
  spec.version       = DeliverAsap::VERSION
  spec.authors       = ['Per Hallström']
  spec.email         = ['hallstroem@gmail.com']

  spec.summary       = "Adds a #deliver_asap method to Mail::Message that delivers a mail 'ASAP' in the background"
  spec.description   = "Adds a #deliver_asap method to Mail::Message that, using Rufus scheduler, delivers an email in the background. The mail is 'optimistically' delivered: if the application is shut down during delivery, the mail will not be sent."
  spec.homepage      = 'https://github.com/perhallstroem/deliver_asap'
  spec.license       = 'Unlicense'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency 'rufus-scheduler', '~> 3.0'
end
