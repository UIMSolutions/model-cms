module models.cms.entities.blog;

@safe:
import models.cms;

class DCMSBlog : DCMSPost {
  mixin(EntityThis!("CMSBlog"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addAttributes([
        "blogId": UUIDAttribute
      ]) 
      .registerPath("cms_blogs");
  }
}
mixin(EntityCalls!("CMSBlog"));

