module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  mixin(EntityThis!("CMSOffer"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "offerId": UUIDAttribute
      ]) 
      .registerPath("cms_offers")
      .routingPath("/cms/offers");
  }
}
mixin(EntityCalls!("CMSOffer"));
