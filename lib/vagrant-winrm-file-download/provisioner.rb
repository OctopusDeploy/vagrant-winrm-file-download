module VagrantPlugins
  module WinRmFileDownload
    class Provisioner < Vagrant.plugin("2", :provisioner)
      def provision
        # this is pratically identical to https://github.com/hashicorp/vagrant/blob/9eac6ae62d6ad7acdd173fabe558ba75156245b6/plugins/provisioners/file/provisioner.rb
        @machine.communicate.tap do |comm|
          source = expand_guest_path(config.source)
          destination = File.expand_path(config.destination)

          # If the source is a directory determine if any path modifications
          # need to be applied to the source for upload behavior. If the original
          # source value ends with a "." or if the original source does not end
          # with a "." but the original destination ends with a file separator
          # then append a "." character to the new source. This ensures that
          # the contents of the directory are uploaded to the destination and
          # not folder itself.
          if File.directory?(source)
            if config.source.end_with?(".") ||
                (!config.destination.end_with?(File::SEPARATOR) &&
                !config.source.end_with?("#{File::SEPARATOR}."))
              source = File.join(source, ".")
            end
          end

          @machine.ui.detail("Downloading from #{source} on guest to #{destination} on host.")
          # now download the file
          comm.download(source, destination)
        end
      end

      private

      # Expand the guest path if the guest has the capability
      def expand_guest_path(destination)
        if machine.guest.capability?(:shell_expand_guest_path)
          machine.guest.capability(:shell_expand_guest_path, destination)
        else
          destination
        end
      end
    end
  end
end
