module models.cms.entities.blog;

@safe:
import models.cms;

class DCMSBlog : DCMSPost {
  mixin(EntityThis!("CMSBlog"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "blogId": UUIDAttribute
      ]) 
      .registerPath("cms_blogs");
  }
}
mixin(EntityCalls!("CMSBlog"));

