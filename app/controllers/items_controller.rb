class ItemsController < ApplicationController

  wrap_parameters format: []

  rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found_response

  def index
    items = Item.all.order(price: :asc)
    render json: items.as_json(
      include: {
        user: {except: [:created_at, :updated_at]}
        },
        except: [:created_at, :updated_at, :user_id]
      ),
    status: :ok
  end

end

