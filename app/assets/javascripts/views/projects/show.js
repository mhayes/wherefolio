Wherefolio.Views.ProjectsShow = Backbone.View.extend({
  initialize: function() {
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
  
  uploadComplete: function(file, partial) {
    this.$('ul.thumbnails').append(partial);
  }
});