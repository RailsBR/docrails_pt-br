module ActionController #:nodoc:
  class InvalidAuthenticityToken < ActionControllerError #:nodoc:
  end

  module RequestForgeryProtection
    extend ActiveSupport::Concern

    # TODO : Remove the defined? check when new base is the main base
    if defined?(ActionController::Http)
      include AbstractController::Helpers, Session
    end

    included do
      if defined?(ActionController::Http)
        # Sets the token parameter name for RequestForgery. Calling +protect_from_forgery+
        # sets it to <tt>:authenticity_token</tt> by default.
        cattr_accessor :request_forgery_protection_token

        # Controls whether request forgergy protection is turned on or not. Turned off by default only in test mode.
        class_inheritable_accessor :allow_forgery_protection
        self.allow_forgery_protection = true
      end

      helper_method :form_authenticity_token
      helper_method :protect_against_forgery?
    end
    
    # Protecting controller actions from CSRF attacks by ensuring that all forms are coming from the current web application, not a
    # forged link from another site, is done by embedding a token based on a random string stored in the session (which an attacker wouldn't know) in all
    # forms and Ajax requests generated by Rails and then verifying the authenticity of that token in the controller.  Only
    # HTML/JavaScript requests are checked, so this will not protect your XML API (presumably you'll have a different authentication
    # scheme there anyway).  Also, GET requests are not protected as these should be idempotent anyway.
    #
    # This is turned on with the <tt>protect_from_forgery</tt> method, which will check the token and raise an
    # ActionController::InvalidAuthenticityToken if it doesn't match what was expected. You can customize the error message in
    # production by editing public/422.html.  A call to this method in ApplicationController is generated by default in post-Rails 2.0
    # applications.
    #
    # The token parameter is named <tt>authenticity_token</tt> by default. If you are generating an HTML form manually (without the
    # use of Rails' <tt>form_for</tt>, <tt>form_tag</tt> or other helpers), you have to include a hidden field named like that and
    # set its value to what is returned by <tt>form_authenticity_token</tt>. Same applies to manually constructed Ajax requests. To
    # make the token available through a global variable to scripts on a certain page, you could add something like this to a view:
    #
    #   <%= javascript_tag "window._token = '#{form_authenticity_token}'" %>
    #
    # Request forgery protection is disabled by default in test environment.  If you are upgrading from Rails 1.x, add this to
    # config/environments/test.rb:
    #
    #   # Disable request forgery protection in test environment
    #   config.action_controller.allow_forgery_protection = false
    # 
    # == Learn more about CSRF (Cross-Site Request Forgery) attacks
    #
    # Here are some resources:
    # * http://isc.sans.org/diary.html?storyid=1750
    # * http://en.wikipedia.org/wiki/Cross-site_request_forgery
    #
    # Keep in mind, this is NOT a silver-bullet, plug 'n' play, warm security blanket for your rails application.
    # There are a few guidelines you should follow:
    # 
    # * Keep your GET requests safe and idempotent.  More reading material:
    #   * http://www.xml.com/pub/a/2002/04/24/deviant.html
    #   * http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.1.1
    # * Make sure the session cookies that Rails creates are non-persistent.  Check in Firefox and look for "Expires: at end of session"
    #
    module ClassMethods
      # Turn on request forgery protection. Bear in mind that only non-GET, HTML/JavaScript requests are checked.
      #
      # Example:
      #
      #   class FooController < ApplicationController
      #     protect_from_forgery :except => :index
      #
      #     # you can disable csrf protection on controller-by-controller basis:
      #     skip_before_filter :verify_authenticity_token
      #   end
      #
      # Valid Options:
      #
      # * <tt>:only/:except</tt> - Passed to the <tt>before_filter</tt> call.  Set which actions are verified.
      def protect_from_forgery(options = {})
        self.request_forgery_protection_token ||= :authenticity_token
        before_filter :verify_authenticity_token, :only => options.delete(:only), :except => options.delete(:except)
        if options[:secret] || options[:digest]
          ActiveSupport::Deprecation.warn("protect_from_forgery only takes :only and :except options now. :digest and :secret have no effect", caller)
        end
      end
    end

    protected
      # The actual before_filter that is used.  Modify this to change how you handle unverified requests.
      def verify_authenticity_token
        verified_request? || raise(ActionController::InvalidAuthenticityToken)
      end
      
      # Returns true or false if a request is verified.  Checks:
      #
      # * is the format restricted?  By default, only HTML requests are checked.
      # * is it a GET request?  Gets should be safe and idempotent
      # * Does the form_authenticity_token match the given token value from the params?
      def verified_request?
        !protect_against_forgery?     ||
          request.method == :get      ||
          request.xhr?                ||
          !verifiable_request_format? ||
          form_authenticity_token == params[request_forgery_protection_token]
      end
    
      def verifiable_request_format?
        !request.content_type.nil? && request.content_type.verify_request?
      end
    
      # Sets the token value for the current session.
      def form_authenticity_token
        session[:_csrf_token] ||= ActiveSupport::SecureRandom.base64(32)
      end

      def protect_against_forgery?
        allow_forgery_protection && request_forgery_protection_token
      end
  end
end
