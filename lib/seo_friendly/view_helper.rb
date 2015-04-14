require 'seo_friendly/seo_searcher'
require 'seo_friendly/rules_searcher'
require 'seo_friendly/constructors/meta_container'

module SeoFriendly

  module ViewHelper

    def model_meta_tags(model, action)
      # TODO : implemet model meta tags
    end

    def meta_tags(instance)
      container = SeoSearcher.new(instance).search
      MetaRenderer.render(container, self)
    end

    def meta_container(instance)
      SeoSearcher.search(instance)
    end

  end

end
