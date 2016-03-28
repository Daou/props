class AuthenticatedController < ApplicationController
  before_filter :authenticate_user!
  before_filter :setup_gon, only: :main_app

  def main_app; end

  def users
    render react_component: 'AppContainer'
  end

  private

  def setup_gon
    gon.push(
      environment: Rails.env,
      current_user: current_user,
    )
  end
end
