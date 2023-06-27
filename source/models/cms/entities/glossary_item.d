module models.cms.entities.glossary_item;

import models.cms;

@safe:
class DCMSGlossaryItem : DCMSPost {
  mixin(EntityThis!("CMSGlossaryItem"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "glossaryId": UUIDAttribute
      ]) 
      .registerPath("cms_glossary")
      .routingPath("/cms/glossary");
  }
}
mixin(EntityCalls!("CMSGlossaryItem"));

