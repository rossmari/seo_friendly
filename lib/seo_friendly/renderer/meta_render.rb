module SeoFriendly

  class MetaRenderer

    def self.render(container, context)
      # TODO : change renderer and meta tags structure
      tags = ''
      tags << context.content_tag(:div, container.title, type: 'title')
      tags << context.content_tag(:div, container.description, type: 'description')
      tags << context.content_tag(:div, container.keywords, type: 'keywords')
      context.raw(tags)
    end

  end

end