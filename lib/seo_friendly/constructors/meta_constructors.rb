#TODO RENAME TO META CONSTRUCTORS or META parsers
#TODO: add html escaping for data
require 'seo_friendly/words_splitter'

module SeoFriendly

  # Recommended title tag length: up to 70 characters, 10 words.
  class TitleConstructor

    def self.extract(object)
      WordsSplitter.split(object, 70, 10)
    end

  end

  class DescriptionConstructor

    OMISSION = '...'

    # Recommended description tag length: up to 160 characters.
    # In my document maximal words count is 200
    def self.extract(object)
      # TODO : remove maximal words count some how
      description = WordsSplitter.split(object, 200, 100)
      unless description.end_with?('.')
        description << OMISSION
      end
      return description
    end

  end

  class KeyWordsConstructor

    def self.extract(object)
      WordsSplitter.split(object, 255, 20)
    end

  end

end