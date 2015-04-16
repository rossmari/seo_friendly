module SeoFriendly

  class MetaRenderer

    def self.render(container, context)
      tags = ''
      tags << context.content_tag(:meta, nil, content: container.title, name: 'title')
      tags << context.content_tag(:meta, nil, content: container.description, name: 'description')
      tags << context.content_tag(:meta, nil, content: container.keywords, name: 'keywords')
      context.raw(tags)
    end

  end

end