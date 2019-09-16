require "pathname"

require "vagrant-winrm-file-download/plugin"

module VagrantPlugins
  module WinRmFileDownload
    lib_path = Pathname.new(File.expand_path("../vagrant-winrm-file-download", __FILE__))
    autoload :Action, lib_path.join("action")
    autoload :Errors, lib_path.join("errors")
  end
end
