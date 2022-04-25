module models.cms.entities.news;

@safe:
import models.cms;


class DCMSNewsItem : DCMSPost {
  mixin(EntityThis!("CMSNewsItem"));

  override void initialize() {
    super.initialize;

    this
      .attribute("newsId", OOPUUIDAttribute) 
      .registerPath("cms_news");
  }
}
mixin(EntityCalls!("CMSNewsItem"));



