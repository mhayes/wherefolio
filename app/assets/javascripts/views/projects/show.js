Wherefolio.Views.ProjectsShow = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, 'initializeUploader', 'initializeSortable');
    this.initializeUploader();
    this.initializeSortable();
  },
  
  initializeUploader: function() {
    _.bindAll(this, 'onUploadFile', 'onUploadComplete', 'onQueueComplete');
    var uploadBtn = this.$('#uploadButton');
    uploadBtn.uploadifive({
      buttonClass: 'btn',
      queueID: 'uploadQueue',
      uploadScript: uploadBtn.data('upload-path'),
      formData: {
        authenticity_token: $('meta[name=csrf-token]').attr('content'),
        '_http_accept': 'application/javascript'
      },
      onUploadFile: this.onUploadFile,
      onUploadComplete: this.onUploadComplete,
      onQueueComplete: this.onQueueComplete
    });
  },
  
  initializeSortable: function() {
    _.bindAll(this, 'sortUpdate');
    this.$('#uploadedPhotos').sortable({
      update: this.sortUpdate
    });
  },
  
  events: {
    'ajax:success .js-delete': 'destroyPhoto'
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
  
  onUploadFile: function(file) {
    // queue up spinner
  },
  
  onUploadComplete: function(file, partial) {
    this.$('#uploadedPhotos').append(partial);
  },
  
  onQueueComplete: function(queueData) {
    this.$('.progress').removeClass('active');
  },
  
  destroyPhoto: function(event) {
    $(event.currentTarget).closest('li.photo').fadeOut();
  }
});