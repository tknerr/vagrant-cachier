module VagrantPlugins
  module Cachier
    class Bucket
      class Omnibus < Bucket
        def self.capability
          :vagrant_omnibus
        end

        def install
          puts "xxx - bucket: install omnibus bucket"
          if guest.capability?(:vagrant_omnibus)
            downloads_dir = guest.capability(:vagrant_omnibus)
            puts "xxx - bucket: symlink omnibus downloads dir"
            symlink(downloads_dir)
          else
            @env[:ui].info I18n.t('vagrant_cachier.skipping_bucket', bucket: 'Omnibus')
          end
        end
      end
    end
  end
end
