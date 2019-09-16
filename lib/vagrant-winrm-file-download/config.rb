require "vagrant"

module VagrantPlugins
  module WinRmFileDownload
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :source
      attr_accessor :destination

      def validate(machine)
        errors = _detected_errors

        if !source
          errors << "No source file specified"
        end
        if !destination
          errors << "No destination path specified"
        end
        { "WinRm file download provisioner" => errors }
      end
    end
  end
end
