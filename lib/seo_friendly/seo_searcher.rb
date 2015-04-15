require 'seo_friendly/seo_creator'
module SeoFriendly

  class SeoSearcher

    attr_reader :id, :type

    def initialize(searchable_id, searchable_type)
      @id = searchable_id
      @type = searchable_type
    end

    def search
      SeoParam.where(searchable_type: type, searchable_id: id).first
    end

  end

end