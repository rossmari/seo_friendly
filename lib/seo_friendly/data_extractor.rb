require 'seo_friendly/constructors/meta_constructors'
module SeoFriendly

  class DataExtractor

    attr_reader :source, :title, :description, :keywords

    # a little bit of metaprogramming
    EXTRACTORS = { title: TitleConstructor, description: DescriptionConstructor, keywords: KeyWordsConstructor }

    def initialize(source)
      @source = source
      extract_information
    end

    def seo_attributes
      { title: title, description: description, keywords: keywords }
    end

    private

    def extract_information
      EXTRACTORS.each do |attribute_name, extractor_class|
        instance_variable_set("@#{attribute_name}", extractor_class.send(:extract, source.send(attribute_name)))
      end
    rescue => exception
      raise ExtractDataFromSourceError.new(source.name, exception.message)
    end


  end

end