require "vagrant"

module VagrantPlugins
  module WinRmFileDownload
    class Plugin < Vagrant.plugin("2")
      name "winrm-file-download"
      description <<-DESC
        Provides support for downloading a file from the guest
        to the host via WinRM.
      DESC

      config("winrm-file-download", :provisioner) do
        require File.expand_path("../config", __FILE__)
        Config
      end

      provisioner("winrm-file-download") do
        require File.expand_path("../provisioner", __FILE__)
        Provisioner
      end
    end
  end
end