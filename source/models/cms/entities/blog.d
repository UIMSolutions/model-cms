module models.cms.entities.blog;

import models.cms;

@safe:
class DCMSBlog : DCMSPost {
  mixin(EntityThis!("CMSBlog"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "blogId": UUIDAttribute
      ]) 
      .registerPath("cms_blogs")
      .routingPath("/cms/blogs");
  }
}
mixin(EntityCalls!("CMSBlog"));

///
unittest {
  auto id = randomUUID;
  auto blog = new DCMSBlog;
  assert(blog.className == "CMSBlog");
  assert(blog.className != "abc");
  
  blog["blogId"] = id;
  assert(blog["blogId"] == id.toString);
  assert(blog["blogId"] != randomUUID.toString);
}
