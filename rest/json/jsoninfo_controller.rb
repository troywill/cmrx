class JsoninfoController < ApplicationController
  def customer
    @customer = User.find(params[:id])
    respond_to do |format|
      format.json { render :layout => false , :json => @customer.to_json }
    end
  end
end
