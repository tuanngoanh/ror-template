module FlashHelper
  ALERT_TYPES = [:success, :standard, :secondary, :alert] unless const_defined?(:ALERT_TYPES)
  def flash_messages(options = {})
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym
      type = :info if type == :notice
      type = :error   if type == :alert
      text = "toastr.#{type}(#{message.inspect});"
      flash_messages << text.html_safe if message
    end
    flash.clear()
    flash.discard()
    new_flash = "<script type='text/javascript'>"<<flash_messages.join("\n").html_safe<<"</script>"
    new_flash.html_safe if flash_messages.present?

  end
end