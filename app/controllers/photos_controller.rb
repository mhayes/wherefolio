class PhotosController < ApplicationController
  def create
    @photo = Photo.new
    @photo.image = params[:Filedata][0]
    @photo.name  = params[:Filedata][0].original_filename
    @photo.project_id = params[:project_id]
    @photo.save
    render partial: "projects/photo_thumbnail", locals: {photo: @photo}
  end
end