class PhotosController < ApplicationController
  def index
    matching_photos= Photo.all.order({:created_at => :desc})
    
    
    
    @list_of_photos = matching_photos

    render({template: "photo_templates/photos"})
  end

  def show
    url_id = params.fetch("photo_id")

    matching_photos = Photo.where({id: url_id})

    @the_photo = matching_photos.at(0)

    render({template: "photo_templates/show"})
  end

  def delete
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({id: the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy
    redirect_to("/photos")
  end
end
