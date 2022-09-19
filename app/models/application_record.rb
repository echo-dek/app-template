class ApplicationRecord < ActiveRecord::Base
  include Observable

  primary_abstract_class

  after_commit :trigger_create, on: :create
  after_commit :trigger_update, on: :update
  after_commit :trigger_destroy, on: :destroy

  def to_s
    return name if self.respond_to? :name
    return title if self.respond_to? :title
  end

  def to_param
    "#{id}-#{to_s}".parameterize
  end

  def trigger_create
    trigger :created
  end

  def trigger_update
    trigger :updated, params: saved_changes_to_s
  end

  def trigger_destroy
    trigger :destroyed, params: { id: self.id, class_name: self.class.name, description: self.to_s }, async: false
  end

  def saved_changes_to_s
    saved_changes.transform_values { |v| v.to_s }
  end
end
