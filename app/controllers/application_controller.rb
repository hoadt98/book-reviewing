class ApplicationController < ActionController::Base
  before_action :get_categories

  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :set_locale

  protected

  def get_categories
    @categories = Category.all
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
