# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-winrm-file-download/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-winrm-file-download"
  spec.version       = Vagrant::WinRmFileDownload::VERSION
  spec.authors       = ["Matt Richardson"]
  spec.email         = ["matt.richardson@octopus.com"]
  spec.summary       = "WinRM file download Provisioner for Vagrant"
  spec.description   = "Provisioner plugin that downloads files from guest to host with Vagrant."
  spec.homepage      = "https://github.com/OctopusDeploy/vagrant-winrm-file-download"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
