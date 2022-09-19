class Omniauth::Provider < ApplicationRecord
  belongs_to :authenticatable, polymorphic: true
  validates :provider, presence: true
  validates :uid, presence: true
  serialize :info, Hash
  serialize :credentials, Hash

  class << self
    def find_from(auth_data)
      provider = Provider.find_by! provider: auth_data[:provider], uid: auth_data[:uid]
      provider.update info: auth_data[:info], credentials: auth_data[:credentials]
    rescue ex
      Rails.logger.error ex.inspect
      return nil
    end
  end
end
