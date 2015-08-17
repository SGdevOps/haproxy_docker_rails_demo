class WelcomeController < ApplicationController
  def index
    SomethingMailer.welcome_mail(hostname).deliver_later(wait: 1.minute)

    render text: "RAILS APP - HOSTNAME: #{hostname}"
  end

  def health_check
    head 200
  end

  private

  def hostname
    ENV['HOSTNAME']
  end
end
