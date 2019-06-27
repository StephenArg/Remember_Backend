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

  def edit
    entry = Entry.find(params["entry_id"])
    entry.update(content: params["content"])

    if entry.save
      render json: {entry: entry}
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

  def random
    user = User.find(params["user"]["id"])

    # if user.entries.count > 5
      if user.current_date == user.date_random_chosen
        # add in manual condition in case user deletes random-entry through calender while id is still stored
        render json: {post: Entry.find(7)}

      else
        offset = rand(user.entries.count)
        random_entry = user.entries.offset(offset).limit(1)[0]
        user.update(random_entry_id: random_entry.id, date_random_chosen: user.current_date)
        render json: {post: random_entry}
      end

    # # else
    #
    # end

  end

end
