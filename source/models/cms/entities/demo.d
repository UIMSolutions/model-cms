module models.cms.entities.demo;

@safe:
import models.cms;

class DCMSDemo : DCMSPost {
  mixin(OOPEntityThis!("CMSDemo"));

  override void initialize() {
    super.initialize;

    this
      .attribute("demoId", OOPUUIDAttribute) 
      .registerPath("cms_demos");
  }
}
mixin(OOPEntityCalls!("CMSDemo"));


