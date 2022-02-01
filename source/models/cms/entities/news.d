module models.cms.entities.news;

@safe:
import models.cms;


class DCMSNewsItem : DCMSPost {
  mixin(OOPEntityThis!("CMSNewsItem"));

  override void initialize() {
    super.initialize;

    this
      .attribute("newsId", OOPAttributeUUID) 
      .registerPath("cms_news");
  }
}
mixin(OOPEntityCalls!("CMSNewsItem"));



