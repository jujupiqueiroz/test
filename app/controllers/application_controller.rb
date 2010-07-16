class ApplicationController < ActionController::Base
helper :all
protect_from_forgery

helper_method :current_user
before_filter :set_locale 
def set_locale 
# if params[:locale] is nil then I18n.default_locale will be used  
  I18n.locale = params[:locale] 
end 
def extract_locale_from_tld
 parsed_locale = request.host.split('.').last
 (available_locales.include? parsed_locale) ? parsed_locale : nil 
 
 end 
def available_locales; AVAILABLE_LOCALES; end 
private

def current_user_session
  return @current_user_session if defined?(@current_user_session)
  @current_user_session = UserSession.find
end

def current_user
  return @current_user if defined?(@current_user)
  @current_user = current_user_session && current_user_session.record
end
def require_user #informa o que precisa estar logado
  unless current_user
    store_location
            redirect_to new_user_session_url
            return false
        end
end

def require_no_user #informa o que não precisa estar logado
        if current_user
            store_location
            redirect_to account_url
            return false
        end
end

def store_location #retorna a ultima url que não pode ser acessada, pois o usuário não estava logado
	session[:return_to] = request.request_uri
end

def redirect_back_or_default(default) #retorna para a ultima url que não pode ser acessada ou a definida como default
	redirect_to(session[:return_to] || default)
	session[:return_to] = nil
end
end

