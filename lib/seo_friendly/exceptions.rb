module SeoFriendly

  class RuleNotDefinedError < StandardError

    MESSAGE = 'Unable to find seo rule %{policy_name} for %{object} class'

    attr_reader :object

    def initialize(policy, object)
      super( MESSAGE % { policy_name: policy, object: object} )
      @object = object
    end

  end

  class UnknownSeoAttributeError < StandardError

    MESSAGE = 'Unknown seo attribute method \'%{seo_method}\' for field \'%{seo_field}\'.'

    attr_reader :object

    def initialize(seo_field, seo_method)
      super( MESSAGE % { seo_field: seo_field, seo_method: seo_method } )
      @object = object
    end

  end

  class UnknownSeoModeError < StandardError

    MESSAGE = 'Unknown seo mode value %{seo_mode}'

    attr_reader :object

    def initialize(mode)
      super( MESSAGE % { seo_mode: mode} )
      @object = object
    end

  end

end