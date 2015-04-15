require 'seo_friendly/source_searcher'
require 'seo_friendly/data_extractor'
require 'seo_friendly/seo_params_processor'

module SeoFriendly
  class SeoCreator < SeoParamsProcessor

    def create
      SeoParam.create(extracted_seo_attributes.merge(searchable: instance))
    end

  end
end