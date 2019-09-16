# Vagrant WinRM File Downloader Plugin

This is a super simple vagrant provisioner plugin that allows you to download files from the guest to the host.

## Installation

```vagrant plugin install vagrant-winrm-file-download```

## Usage

In your Vagrantfile, add the following plugin and configure to your needs:

```ruby
  config.vm.provision "winrm-file-download" do |file|
    file.source = 'c:\temp\foo.txt'
    file.destination = 'c:\temp\foo-downloaded.txt'
  end
```

## Uninstallation

```vagrant plugin uninstall vagrant-dsc```

## Development

Before getting started, read the Vagrant plugin [development basics](https://docs.vagrantup.com/v2/plugins/development-basics.html) and [packaging](https://docs.vagrantup.com/v2/plugins/packaging.html) documentation.

Development was done against:
* Ruby 2.6.4
* Bundler 1.17.2, and 
* vagrant [master@9eac6ae62d6a](https://github.com/hashicorp/vagrant/commit/9eac6ae62d6ad7acdd173fabe558ba75156245b6), which is likely to be 2.2.6

```
git clone git@github.com:OcotpusDeploy/vagrant-winrm-file-download.git
cd vagrant-winrm-file-download
bundle install
```

Run tests:
```
# tests are... not yet there
bundle exec rake spec
```

Run Vagrant in context of current vagrant-dsc plugin:
```
cd <directory>
bundle exec vagrant up
```

### Building a new version
1. update the version number in the `lib/vagrant-winrm-file-download.rb`
1. run `gem build .\vagrant-winrm-file-download.gemspec`

## Contributing

1. Create a github issue to discuss your idea
1. Fork it ( https://github.com/[your-github-username]/vagrant-winrm-file-download/fork )
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes, including relevant tests (`git commit -am 'Add some feature'`)
1. Squash commits & push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request
