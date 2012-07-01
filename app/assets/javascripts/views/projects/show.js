Wherefolio.Views.ProjectsShow = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'initializeUploader', 'initializeSortable');
    this.initializeUploader();
    this.initializeSortable();
  },
  
  initializeUploader: function() {
    _.bindAll(this, 'uploadComplete');
    var uploadBtn = this.$('#uploadButton');
    uploadBtn.uploadifive({
      buttonClass: 'btn',
      queueID: 'uploadQueue',
      uploadScript: uploadBtn.data('upload-path'),
      formData: {
        authenticity_token: $('meta[name=csrf-token]').attr('content'),
        '_http_accept': 'application/javascript'
      },
      onUploadComplete: this.uploadComplete
    });
  },
  
  initializeSortable: function() {
    _.bindAll(this, 'sortUpdate');
    this.$('#uploadedPhotos').sortable({
      update: this.sortUpdate
    });
  },
  
  sortUpdate: function(event, ui) {
    var photos = this.$('#uploadedPhotos').sortable('serialize');
    $.ajax({
      type: 'post',
      url: this.$('#uploadedPhotos').data('sort-path'),
      data: photos,
      dataType: 'script'
    });
  },
  
  uploadComplete: function(file, partial) {
    this.$('#uploadedPhotos').append(partial);
  }
});