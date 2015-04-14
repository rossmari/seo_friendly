require 'action_view'
require 'seo_friendly/version'
require 'seo_friendly/seo_searcher'
require 'seo_friendly/exceptions'
require 'seo_friendly/renderer/meta_render'
require 'seo_friendly/view_helper'
require 'seo_friendly/model_helper'

module SeoFriendly

  ActionView::Base.send :include, SeoFriendly::ViewHelper
  ActiveRecord::Base.send :extend, SeoFriendly::ModelHelper

end
