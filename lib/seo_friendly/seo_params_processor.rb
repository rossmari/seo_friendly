require 'seo_friendly/source_searcher'
require 'seo_friendly/data_extractor'

module SeoFriendly
  class SeoParamsProcessor

    attr_reader :instance, :raw_data_source, :extracted_seo_attributes

    def initialize(instance)
      @instance = instance
      @raw_data_source = create_data_source
      @extracted_seo_attributes = extract_seo_attributes
    end

    private

    def create_data_source
      source_class = SourceSearcher.new(instance).find_source
      source_class.new(instance)
    end

    def extract_seo_attributes
      extractor = DataExtractor.new(raw_data_source)
      extractor.seo_attributes
    end

  end
end