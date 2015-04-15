class SeoParam < ActiveRecord::Base

  # === REFERENCES
  belongs_to :searchable, polymorphic: true

end
