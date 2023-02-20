module models.cms.entities.demo;

@safe:
import models.cms;

class DCMSDemo : DCMSPost {
  mixin(EntityThis!("CMSDemo"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addValues([
        "demoId": UUIDAttribute
      ]) 
      .registerPath("cms_demos");
  }
}
mixin(EntityCalls!("CMSDemo"));


