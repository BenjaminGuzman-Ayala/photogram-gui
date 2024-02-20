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
  def create
  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save



    # render({template: "photo_templates/create"})
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({id: the_id})
    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save
    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def add_comment
    comment_image_id = params.fetch("input_photo_id")
    comment_author_id = params.fetch("input_author_id")
    comment = params.fetch("input_comment")
    
    a_new_comment = Comment.new
    a_new_comment.author_id = comment_author_id
    a_new_comment.photo_id = comment_image_id
    a_new_comment.body = comment
    a_new_comment.save


    matching_photos = Photo.where({id: comment_image_id})
    the_photo = matching_photos.at(0)


    redirect_to("/photos/" + the_photo.id.to_s)

  end
end
