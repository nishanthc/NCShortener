class Url < ActiveRecord::Base
 validates :long_url, presence: true
 validates :long_url, url: true
end
