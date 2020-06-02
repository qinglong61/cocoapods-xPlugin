# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-xPlugin/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = CocoapodsXplugin::NAME
  spec.version       = CocoapodsXplugin::VERSION
  spec.authors       = ['段清伦']
  spec.email         = ['qinglong61@163.com']
  spec.description   = %q{寻找更快速的镜像来缩短下载的时间}
  spec.summary       = %q{一个致力于更快捷、方便的CocoaPods插件}
  spec.homepage      = 'https://github.com/qinglong61/cocoapods-xPlugin'
  spec.license       = 'MIT'

  # spec.files         = `git ls-files`.split($/)
  spec.files         = Dir['lib/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.extra_rdoc_files = ['README.md']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
