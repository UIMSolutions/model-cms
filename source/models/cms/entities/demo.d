module models.cms.entities.demo;

import models.cms;

@safe:
class DCMSDemo : DCMSPost {
  mixin(EntityThis!("CMSDemo"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "demoId": UUIDAttribute
      ]) 
      .registerPath("cms_demos")
      .routingPath("/cms/demos");
  }
}
mixin(EntityCalls!("CMSDemo"));


