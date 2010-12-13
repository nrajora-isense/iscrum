# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

   def yield_for(content_sym, default)
    output = content_for(content_sym)
    output = default if output.blank?
    output
  end
end
