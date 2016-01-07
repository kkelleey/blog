class SessionsController < ApplicationController
  def new
  end

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.now.notice = status.failure_message
        render template: "sign_in", status: :unauthorized
      end
    end
  end

  private

  def url_after_create
    Clearance.configuration.redirect_url
  end
end
