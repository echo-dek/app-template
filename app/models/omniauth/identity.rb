require "omniauth-identity"

class Omniauth::Identity < OmniAuth::Identity::Models::ActiveRecord
  belongs_to :authenticatable, polymorphic: true
  validates :email, presence: true
end
