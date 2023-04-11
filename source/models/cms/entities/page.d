module models.cms.entities.page;

@safe:
import models.cms;

class DCMSPage : DCMSEntity {
  mixin(EntityThis!("CMSPage"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "keywords": TagsAttribute,
        "isPrivate": BooleanAttribute,
        "page": UUIDAttribute,
        "url": StringAttribute
      ])
      .registerPath("cms_pages")
      .routingPath("/cms/pages");
  }
}
mixin(EntityCalls!("CMSPage"));
