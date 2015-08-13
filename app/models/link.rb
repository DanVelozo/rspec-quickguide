class Link < ActiveRecord::Base
  validates :url, presence: true
  validates_format_of :url, with: %r[\Ahttps?://]i, allow_blank: true
end
