module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  mixin(EntityThis!("CMSLink"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "linkId": UUIDAttribute
      ]) 
      .registerPath("cms_links")
      .routingPath("/cms/links");
  }
}
mixin(EntityCalls!("CMSLink"));


