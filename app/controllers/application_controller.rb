class ApplicationController < ActionController::Base
  def current_ability
    if admin_signed_in?
      @current_ability ||= Ability.new(current_admin)
    elsif author_signed_in?
      @current_ability ||= Ability.new(current_author)
    elsif reader_signed_in?
      @current_ability ||= Ability.new(current_reader)
    else
      raise "You are not authorised to perform the action"
    end
  end
end
