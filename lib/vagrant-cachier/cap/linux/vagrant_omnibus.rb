module VagrantPlugins
  module Cachier
    module Cap
      module Linux
        module VagrantOmnibus
          # read: any linux guest can be provided with omnibus packages
          # via vagrant-omnibus iff the plugin is present and enabled
          def self.vagrant_omnibus(machine)
            plugin_defined = defined?(VagrantPlugins::Omnibus::Plugin)
            puts "xxx - cap: vagrant-omnibus defined? #{plugin_defined}"
            return unless plugin_defined
            
            chef_version = machine.config.omnibus.chef_version
            puts "xxx - cap: chef_version? #{chef_version}" 
            return unless chef_version

            # since it's not configurable via the vagrant-omnibus plugin (yet)
            # we specify the directory where to download the omnibus package here
            download_dir = "/tmp/vagrant-omnibus-downloads"
            ENV['OMNIBUS_DOWNLOAD_DIR'] = download_dir
            return download_dir
          end
        end
      end
    end
  end
end
