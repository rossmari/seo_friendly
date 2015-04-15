module SeoFriendly
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      # TODO : rename method
      def copy_default_seo_source
        template 'default_source.rb', 'app/seo_sources/default_source.rb'
      end

      def copy_migrations
        migration_template 'migrations/create_seo_params.rb', 'db/migrate/create_seo_params.rb'
      end

      def self.next_migration_number(dir)
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

    end
  end
end
