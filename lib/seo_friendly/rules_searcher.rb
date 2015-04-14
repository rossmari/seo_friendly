module SeoFriendly
  class RulesSearcher

    attr_reader :object

    def initialize(model)
      @object = model
    end

    def find_rule
      rule
    end

    def find_rule!
      rule or raise RuleNotDefinedError.new(find, object)
    end

    private

    def rule
      klass = find
      klass = klass.constantize if klass.is_a?(String)
      klass
    rescue NameError
      nil
    end

    def find
      if object.respond_to?(:policy_class)
        object.policy_class
      elsif object.class.respond_to?(:policy_class)
        object.class.policy_class
      else
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
        "#{klass}Rule"
      end
    end
  end
end
