class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def to_s
    return name if self.respond_to? :name
    return title if self.respond_to? :title
  end

  def to_param
    "#{id}-#{to_s}".parameterize
  end
end
