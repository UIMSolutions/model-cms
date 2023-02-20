module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  mixin(EntityThis!("CMSOffer"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addAttributes([
        "offerId": UUIDAttribute
      ]) 
      .registerPath("cms_offers");
  }
}
mixin(EntityCalls!("CMSOffer"));
