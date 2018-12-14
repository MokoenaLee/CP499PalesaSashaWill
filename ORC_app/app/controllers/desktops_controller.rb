class DesktopsController < ApplicationController
    before_action :authenticate_administrator!
end
