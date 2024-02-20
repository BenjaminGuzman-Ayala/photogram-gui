class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({username: :asc})
    render({template: "user_templates/index"})
  end

  def add_user
    user_name = params.fetch("input_username")
    new_user = User.new
    new_user.username = user_name
    new_user.save

    the_id = new_user.id

    redirect_to("/users/" + new_user.username ,{notice: "user created successfully"})
  end

  def update_user
    the_id = params.fetch("path_id")
    matching_records = User.where({id: the_id})
    the_user = matching_records.at(0)

    input_username = params.fetch("input_username")
    the_user.username = input_username
    the_user.save
    redirect_to("/users/" + the_user.username)
  end

  def show
    url_username = params.fetch("username")
    matching_usernames = User.where({username: url_username})
    @the_user = matching_usernames.first

    render({template: "user_templates/show"})
  end
end
