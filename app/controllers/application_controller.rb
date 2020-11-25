class ApplicationController < ActionController::Base
  include Clearance::Controller
  layout 'application'
  def index
  end
end
