# SeoFriendly

SeoFriendly gem provides easy way to insert meta information (title, description, keywords) on almost all pages of your application.
Gem extract meta information for model from it's fields or from any source you specify.

## Installation

```ruby
gem 'seo_friendly'
```

For fast gem integration run generator that copy migration files and default source config into your application.
Gem use monkey patching to add new methods to ActiveRecord and new view helpers.

    $ rails generate seo_friendly:install

## Usage

Create your own seo source class for any model and specify information which will be used to create meta tags.
Example:
```ruby
# seo source class for Page model
class PageSeoSource < DefaultSeoSource

  # title information will be extracted from title field of Page instance
  def title
    instance.title
  end

  # description will be always constant for Page
  def description
    'Awesome pages of my beautiful application'
  end

  # Page model can have for example tags reference that you can use to generate keywords.
  def keywords
    instance.tags.join(' ,')
  end

end
```

Then on views you can insert meta tags

```haml
  = meta_tags(@page) %>
```

To update meta information every time when you update records add to model callback:
```ruby
  after_save :update_seo_attributes
```

## TODO
 1) Do not add an omission if length was not striped
 2) Add tests
 3) block and procs for seo attributes
 4) Renderer
 5) Controller helpers
 6) WordsSplitter is too slow, replace it with regular expression (change)


1. Fork it ( https://github.com/[my-github-username]/seo_friendly/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
