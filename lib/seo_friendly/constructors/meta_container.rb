require 'seo_friendly/constructors/meta_constructors'
module SeoFriendly

  class MetaContainer

    attr_reader :container, :title, :description, :keywords

    def initialize(container)
      @container = container
      fill_attributes
    end

    private

    def fill_attributes
      @title = TitleConstructor.extract(container.title)
      @description = DescriptionConstructor.extract(container.description)
      @keywords = KeyWordsConstructor.extract(container.keywords)
    end

  end

end