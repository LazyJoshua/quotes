module ApplicationHelper

  def render_turbo_stream_flash_message
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
  
  def form_error_notification(resource)
    if resource.errors.any?
      tag.div class: "error-message" do
        resource.errors.full_messages.to_sentence.capitalize
      end
    end
  end

end
