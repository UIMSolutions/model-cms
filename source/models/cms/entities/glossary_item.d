module models.cms.entities.glossary_item;

@safe:
import models.cms;

class DCMSGlossaryItem : DCMSPost {
  mixin(EntityThis!("CMSGlossaryItem"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addAttributes([
        "glossaryId": UUIDAttribute
      ]) 
      .registerPath("cms_glossary");
  }
}
mixin(EntityCalls!("CMSGlossaryItem"));

