module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  mixin(EntityThis!("CMSOffer"));

  override void initialize() {
    super.initialize;

    this
      .addValues([
        "offerId": UUIDAttribute
      ]) 
      .registerPath("cms_offers");
  }
}
mixin(EntityCalls!("CMSOffer"));
