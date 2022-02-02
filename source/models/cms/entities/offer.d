module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  mixin(OOPEntityThis!("CMSOffer"));

  override void initialize() {
    super.initialize;

    this
      .attribute("offerId", OOPUUIDAttribute) 
      .registerPath("cms_offers");
  }
}
mixin(OOPEntityCalls!("CMSOffer"));
