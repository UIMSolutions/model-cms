module models.cms.entities.page;

@safe:
import models.cms;

class DCMSPage : DCMSEntity {
  mixin(OOPEntityThis!("CMSPage"));

  override void initialize() {
    super.initialize;

    this
    .attribute("keywords", OOPTagsAttribute) 
    .attribute("isPrivate", OOPBooleanAttribute) 
    .attribute("page", OOPUUIDAttribute)
    .attribute("url", OOPStringAttribute)
    .registerPath("cms_pages");
  }
}
mixin(OOPEntityCalls!("CMSPage"));
