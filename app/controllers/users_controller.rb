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
    user = User.find_by(username: params["username"].downcase)

    if user && user.authenticate(params["password"])
      payload = {username: user.username}
      token = JWT.encode(payload, ENV["SECRET"])
      user.update(current_date: params["date"])
      render json: {user: user, jwt: token}
    else
      puts "error"
    end

  end

  def authenticate
    begin
      if JWT.decode(params["jwt"], ENV["SECRET"])
        username = JWT.decode(params["jwt"], ENV["SECRET"])[0]["username"].downcase
        user = User.find do |u|
          u.username.downcase == username
        end
        user.update(current_date: params["date"])
        render json: user
      end
    rescue
      render json: {"error": "token error"}
    end
  end

end
