module models.cms.entities.blog;

@safe:
import models.cms;

class DCMSBlog : DCMSPost {
  mixin(OOPEntityThis!("CMSBlog"));

  override void initialize() {
    super.initialize;

    this
      .attribute("blogId", OOPUUIDAttribute) 
      .registerPath("cms_blogs");
  }
}
mixin(OOPEntityCalls!("CMSBlog"));

