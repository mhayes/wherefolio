class Wherefolio.Views.ProjectsShow extends Backbone.View
  initialize: ->
    _.bindAll @, "initializeUploader", "initializeSortable"
    @initializeUploader()
    @initializeSortable()

  initializeUploader: ->
    _.bindAll @, "onUploadFile", "onUploadComplete", "onQueueComplete"
    uploadBtn = @.$("#uploadButton")
    uploadBtn.uploadifive
      buttonClass: "btn"
      buttonText: "Add Photos"
      queueID: "uploadQueue"
      uploadScript: uploadBtn.data("upload-url")
      formData:
        authenticity_token: $("meta[name=csrf-token]").attr("content")
        _http_accept: "application/javascript"

      onUploadFile: @onUploadFile
      onUploadComplete: @onUploadComplete
      onQueueComplete: @onQueueComplete

  initializeSortable: ->
    _.bindAll this, "sortUpdate"
    @.$("#uploadedPhotos").sortable update: @sortUpdate

  events:
    "ajax:success .js-delete": "destroyPhoto"

  sortUpdate: (event, ui) ->
    photos = @.$("#uploadedPhotos").sortable("serialize")
    $.ajax
      type: "post"
      url: @.$("#uploadedPhotos").data("sort-url")
      data: photos
      dataType: "script"

  onUploadFile: (file) ->

  onUploadComplete: (file, partial) ->
    @.$("#uploadedPhotos").append partial

  onQueueComplete: (queueData) ->
    @.$(".progress").removeClass "active"

  destroyPhoto: (event) ->
    $(event.currentTarget).closest("li.photo").fadeOut()
