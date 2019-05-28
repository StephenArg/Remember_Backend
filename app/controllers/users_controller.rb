class UsersController < ApplicationController
  def create
    user = User.new(username: params["username"], password: params["password"],
                    name: params["name"], current_date: params["date"])
    if user.save
      payload = {username: user.username}
      token = JWT.encode(payload, ENV["SECRET"])
      render json: {user: user, jwt: token}
      puts "Saved"
    else
      puts "Error"
    end
  end

  def login
    user = User.find_by(name: params["username"])
    byebug
  end

  def authenticate
    begin
      if JWT.decode(params["jwt"], ENV["SECRET"])
        username = JWT.decode(params["jwt"], ENV["SECRET"])[0]["username"].downcase
        user = User.find do |u|
          u.username.downcase == username
        end
        render json: user
      end
    rescue
      render json: {"error": "token error"}
    end
  end

end
