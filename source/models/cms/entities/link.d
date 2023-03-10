module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  mixin(EntityThis!("CMSLink"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addValues([
        "linkId": UUIDAttribute
      ]) 
      .registerPath("cms_links");
  }
}
mixin(EntityCalls!("CMSLink"));


