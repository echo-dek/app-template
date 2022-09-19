module Deleteable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(deleted_at: nil) }
    scope :deleted, -> { where.not(deleted_at: nil) }

    def delete!(time: nil)
      self.update! deleted_at: (time || Time.now)
      trigger :deleted
    end
  end
end
