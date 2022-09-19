class Observable::FireEventHandlersJob < ApplicationJob
  queue_as :low

  def perform(instance: nil, event: nil, params: {})
    instance.class.trigger_for instance, event.to_sym, params: params
  end
end
