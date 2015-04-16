require 'seo_friendly/seo_searcher'
require 'seo_friendly/seo_creator'

module SeoFriendly

  module ViewHelper

    def meta_tags(instance)
      container = SeoSearcher.new(instance.id, instance.class.name).search || SeoCreator.new(instance).create
      MetaRenderer.render(container, self)
    end

    def meta_container(instance)
      SeoSearcher.new(instance.id, instance.class.name).search || SeoCreator.new(instance).create
    end

  end

end
