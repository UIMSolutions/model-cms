module models.cms.entities.glossary_item;

@safe:
import models.cms;

class DCMSGlossaryItem : DCMSPost {
  mixin(EntityThis!("CMSGlossaryItem"));

  override void initialize() {
    super.initialize;

    this
      .addValues([
        "glossaryId": UUIDAttribute
      ]) 
      .registerPath("cms_glossary");
  }
}
mixin(EntityCalls!("CMSGlossaryItem"));

