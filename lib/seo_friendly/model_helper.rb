require 'seo_friendly/seo_creator'
module SeoFriendly

  module ModelHelper

    def update_seo_attributes
      rule_class = RulesSearcher.new(self.class.name).find_rule
      container = MetaContainer.new(rule_class.new(instance))
      SeoCreator.update(container, self)
    end

  end

end