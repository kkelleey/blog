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
      if @photo = Photo.create(photo_params)
        flash.now[:success] = "Photo has been added"
        redirect_to admin_photos_url
      else
        flash.now[:error] = @photo.errors.full_messages
        redirect_to :back
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Post.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def photo_params
      # params.permit(:utf8, :commit, :authenticity_token).require(:photo)
      params.require(:photo).permit(:image)
    end

  end

end
