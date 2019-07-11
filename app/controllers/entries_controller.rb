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
    entry.content = params["content"]

    if entry.save
      render json: {entry: entry}
    else
      puts "Error"
    end

  end

  def delete

    if params["fromTile"]
      entry = Entry.find(params["entryId"])
    else
      date = params["date"]
      entry = Entry.find do |e|
        e.date_created == date
      end
    end

    entry.destroy

    render json: {entry: "none"}
  end

  def verify
    date = params["date"]

    entry = Entry.find do |e|
      e.date_created == date
    end

    if entry
      render json: {entry: entry}
    else
      render json: {entry: "none"}
    end
  end

  def skip
    user = User.find(params["user"]["id"])
    previous_id = user.random_entry_id

    offset = rand(user.entries.count)
    random_entry = user.entries.offset(offset).limit(1)[0]

    while random_entry.id == previous_id
      offset = rand(user.entries.count)
      random_entry = user.entries.offset(offset).limit(1)[0]
    end

    user.update(random_entry_id: random_entry.id, date_random_chosen: user.current_date)
    render json: {post: random_entry}
  end

  def random
    user = User.find(params["user"]["id"])
    begin
      random_entry = Entry.find(user.random_entry_id)
    rescue
      user.date_random_chosen = nil
    end

    if user.entries.count > 5
      if user.current_date == user.date_random_chosen
        # add in manual condition in case user deletes random-entry through calender while id is still stored
        render json: {post: random_entry}

      else
        offset = rand(user.entries.count)
        random_entry = user.entries.offset(offset).limit(1)[0]
        user.update(random_entry_id: random_entry.id, date_random_chosen: user.current_date)
        render json: {post: random_entry}
      end
    end

  end

  def backup
    user = User.find(params["userId"])
    allEntries = {}

    user.entries.each do |entry|
      allEntries["#{entry.date_created}"] = entry.content
    end
    render json: allEntries
  end

  def restore
    user = User.find(params["userId"])

    user.entries.destroy_all
    params["restoreJSON"].each do |date, content|
      Entry.create(date_created: date, user_id: params["userId"], content: content)
    end
    puts "Finished"
  end

  def search
    user = User.find(params["userId"])

    date = params["date"].to_date

    allEntries = user.entries.filter do |entry|
      entry.date_created.to_date <= date
    end

    allEntries.sort! {|a,b| b.date_created.to_date <=> a.date_created.to_date}

    render json: allEntries[0..14]

  end

end
