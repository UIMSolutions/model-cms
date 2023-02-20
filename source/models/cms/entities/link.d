module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  mixin(EntityThis!("CMSLink"));

  override void initialize() {
    super.initialize(configSettings);

    this
      .addValues([
        "linkId": UUIDAttribute
      ]) 
      .registerPath("cms_links");
  }
}
mixin(EntityCalls!("CMSLink"));


