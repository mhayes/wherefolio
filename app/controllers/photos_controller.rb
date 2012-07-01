class PhotosController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @photo = @project.photos.build
    @photo.image = params[:Filedata][0]
    @photo.name  = params[:Filedata][0].original_filename
    @photo.position = @project.photos.count
    @project.save
    render partial: "projects/photo_thumbnail", locals: {photo: @photo}
  end
  
  def sort
    @project = Project.find(params[:project_id])
    params[:photo].each_with_index do |photo_id, idx|
      @project.photos.find(photo_id).position = idx
    end
    @project.save
    head :ok
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @project.photos.find(params[:id]).destroy
    head :ok
  end
end