module SeoFriendly
  class WordsSplitter

    def self.split(object, maximal_length, maximal_words_count)
      if object.length <= maximal_length && words_count(object) <= maximal_words_count
        return object
      else
        object = reduce_string(object)
        split(object, maximal_length, maximal_words_count)
      end
    end

    private

    def self.words_count(object)
      object.split.count
    end

    def self.reduce_string(object)
      array = object.split
      array.delete(array.last)
      array.join(' ')
    end

  end
end