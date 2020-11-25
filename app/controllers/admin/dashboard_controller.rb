class Admin::DashboardController < ApplicationController
  before_action :require_login
  layout 'master'
  def index
  end
end
