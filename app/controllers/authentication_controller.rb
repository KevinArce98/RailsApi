class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
   
    def authenticate
      command = AuthenticateUser.call(params[:username], params[:password])
   
      if command.success?
        render json: { auth_token: command.result }
      else
       render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
      end
    end
   end