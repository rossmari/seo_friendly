#  TODO : rename from RULE to some kind of container (now this class contain only what to use for meta and how to get it)
class DefaultRule
  attr_reader :instance

  def initialize(instance)
    @instance = instance

    @title = title
    @description = description
    @keywords = keywords
  end

  def title
    instance.title
  rescue
    'Default SeoFriendly title'
  end

  def description
    instance.description
  rescue
    'Default SeoFriendly description'
  end

  def keywords
    instance.keywords
  rescue
    'Default SeoFriendly keywords'
  end

end

