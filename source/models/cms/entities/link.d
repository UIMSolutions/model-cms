module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  mixin(OOPEntityThis!("CMSLink"));

  override void initialize() {
    super.initialize;

    this
      .attribute("linkId", OOPUUIDAttribute) 
      .registerPath("cms_links");
  }
}
mixin(OOPEntityCalls!("CMSLink"));


