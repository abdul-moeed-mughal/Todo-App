class AdminController < ApplicationController

  before_filter :require_admin_login
  def index

  end
end
