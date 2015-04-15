require 'seo_friendly/seo_updater'
module SeoFriendly

  module ModelHelper

    def update_seo_attributes
      SeoUpdater.new(self).update
    end

  end

end