require 'rails/railtie'
require 'action_view/base'

module BestInPlace
  class Railtie < ::Rails::Railtie #:nodoc:
    config.after_initialize do
      BestInPlace::ViewHelpers = ViewDelegator.new
      #       BestInPlace::ViewHelpers = ActionView::Base.new
    end
  end
end

class ViewDelegator
  def method_missing(method, *args, &block)
    ActionController::Base.helpers.send(method, *args, &block)
  end
end