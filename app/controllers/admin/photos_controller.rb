module Admin
  class PhotosController < Admin::ApplicationController
    ActionController::Parameters.action_on_unpermitted_parameters = :log
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Post.all.paginate(10, params[:page])
    # end

    def create
      city_id = params[:photo][:city_id]
      added_photos = 0
      params[:photo][:image].each do |photo|
        record = Photo.create(photo_params(photo, city_id))
        if record.errors.any?
          flash[:notice] = record.errors.full_messages.to_sentence
        else
          added_photos += 1
        end
      end
      flash[:notice] = "#{added_photos} photos #{'has'.pluralize(added_photos)} been added"
      redirect_to admin_photos_url
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Post.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def photo_params(photo, city_id)
      { city_id: city_id, image: photo }
    end

  end

end
