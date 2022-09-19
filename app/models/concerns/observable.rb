# Register event handlers onto this object
# Included into ApplicationRecord by default
# and they trigger events for :created, :updated and :deleted
module Observable
  extend ActiveSupport::Concern

  included do
    def trigger(event, params: {}, async: true)
      selector = async ? :perform_later : :perform_now
      Observable::FireEventHandlersJob.send selector, instance: self, event: event.to_sym, params: params
    end
  end

  class_methods do
    # Register an event handler for the given event
    # The event handler is expected to take two parameters - instance and params
    # For example:
    # Person.when :updated do |person, params|
    #   Rails.logger.info "#{person} was updated with #{params}"
    # end
    def when(event, &block)
      event_handlers[event.to_sym] << block
    end

    def trigger_for(instance, event, params: {})
      event_handlers[event.to_sym].each { |handler| handler.call(instance, params) }
    end

    def event_handlers
      @event_handlers ||= Hash.new([])
    end
  end
end
