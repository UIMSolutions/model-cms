module models.cms.entities.blog;

@safe:
import models.cms;

class DCMSBlog : DCMSPost {
  mixin(EntityThis!("CMSBlog"));

  override void initialize() {
    super.initialize(configSettings);

    this
      .addValues([
        "blogId": UUIDAttribute
      ]) 
      .registerPath("cms_blogs");
  }
}
mixin(EntityCalls!("CMSBlog"));

