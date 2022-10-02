class UsersController < ApplicationController

  def show
    user = find_user
    render json: user.as_json(
      include: {
        items: { except: [:created_at, :updated_at, :user_id]}
      },
      except: [:created_at, :updated_at, :user_id]
    ), status: :ok
  end

  private

  def find_user
    User.find(params[:id])
  end

  def render_not_found_response(invalid)
    render json: {errors: invalid.redord.errors.full_messages}
  end
end
