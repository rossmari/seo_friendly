require 'seo_friendly/source_searcher'
require 'seo_friendly/data_extractor'
require 'seo_friendly/seo_params_processor'

module SeoFriendly
  class SeoUpdater < SeoParamsProcessor

    def update
      seo_record = SeoSearcher.new(instance.id, instance.class.name).search
      seo_record.update_attributes(extracted_seo_attributes)
    end

  end
end