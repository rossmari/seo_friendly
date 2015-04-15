require 'seo_friendly'
require 'rails'

module YourGem
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/rebuild_seo_params.rake'
    end
  end
end