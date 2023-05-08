# frozen_string_literal: true

# This module describes API interaction methods
module ApiWrappers
  def create_user_api(user)
    payload = {
      "name": "#{user.firstname} #{user.lastname}",
      "username": user.username,
      "email": user.email,
      "password": user.password,
      "skip_confirmation": true
    }

    response = RestClient.post "#{ENV['API_ROOT_URL']}/users", payload,
                               { Authorization: ENV['API_TOKEN'] }

    raise 'User was not registered via API' unless response.code == 201

    response
  end

  def delete_user_api(id)
    response = RestClient.delete "#{ENV['API_ROOT_URL']}/users/#{id}?hard_delete=true",
                                 { Authorization: ENV['API_TOKEN'] }

    raise 'User was not deleted via API' unless response.code == 204
  end
end