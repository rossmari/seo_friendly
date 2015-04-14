module SeoFriendly
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      # TODO : rename method
      def copy_application_policy
        template 'default_rule.rb', 'app/seo_rules/default_rule.rb'
      end
    end
  end
end
