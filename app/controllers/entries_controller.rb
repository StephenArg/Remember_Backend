class EntriesController < ApplicationController
  def create
    entry = Entry.new(date_created: params["date"], user_id: params["user_id"], content: params["content"])

    if entry.save
      render json: {entry: entry}
      puts "Saved"
    else
      puts "Error"
    end
  end

  def verify
    date = params["date"]

    entry = Entry.find do |e|
      puts e.attributes
      e.date_created == date
    end

    if entry
      render json: {entry: entry}
    else
      render json: {entry: "none"}
    end
  end
end
