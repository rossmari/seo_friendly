require 'seo_friendly/seo_creator'
module SeoFriendly

  class SeoSearcher

    attr_reader :instance

    def initialize(instance)
      @instance = instance
    end

    def search
      InstanceSeoSearcher.search(instance)
    end

    def search_model_seo
      # Refactor
      # ModelSeoReader.fetch(instance, params)
    end

  end

  class InstanceSeoSearcher

    def self.search(instance)
      SeoParam.where(searchable_type: instance.class.name, searchable_id: instance.id).first || create_seo_param(instance)
    end

    # TODO : rename rules to anything else
    def self.create_seo_param(instance)
      rule_class = RulesSearcher.new(instance).find_rule
      # reprocess data from instance to unified container and then save it to db
      container = MetaContainer.new(rule_class.new(instance))
      SeoCreator.create(container, instance)
    end

  end

  # Refactor this or remove
  class ModelSeoReader

    def self.fetch(instance, params = {})
      if params.has_key?(:action)
        model_params = ModelSeoParam.where(name: instance.name, action: params[:action]).first
        model_params.try(:seo_param)
      end
    end

  end

end