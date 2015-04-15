module SeoFriendly
  class SourceSearcher

    attr_reader :object

    def initialize(model)
      @object = model
    end

    def find_source
      source or raise SourceNotDefinedError.new(find, object)
    end

    private

    def source
      klass = find
      klass = klass.constantize if klass.is_a?(String)
      klass
    rescue NameError
      nil
    end

    def find
      klass = if object.respond_to?(:model_name)
        object.model_name
      elsif object.class.respond_to?(:model_name)
        object.class.model_name
      elsif object.is_a?(Class)
        object
      elsif object.is_a?(Symbol)
        object.to_s.classify
      else
        object.class
      end
      "#{klass}SeoSource"
    end
  end
end
