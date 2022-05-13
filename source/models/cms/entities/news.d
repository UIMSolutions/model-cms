module models.cms.entities.news;

@safe:
import models.cms;


class DCMSNewsItem : DCMSPost {
  mixin(EntityThis!("CMSNewsItem"));

  override void initialize() {
    super.initialize;

    this
      .addValues([
        "newsId": UUIDAttribute 
      ])
      .registerPath("cms_news");
  }
}
mixin(EntityCalls!("CMSNewsItem"));



