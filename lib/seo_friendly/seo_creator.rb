module SeoFriendly
  class SeoCreator

    def self.create(container, instance)
      SeoParam.create(title: container.title, description: container.description, keywords: container.keywords, searchable: instance)
    end

    def self.update(container, instance)
      seo_param = SeoParam.find(searchable_id: instance) || SeoParam.create(container, instance)
      seo_param.update_attributes(title: container.title, description: container.description, keywords: container.keywords)
    end

  end
end