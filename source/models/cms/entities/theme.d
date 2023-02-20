module models.cms.entities.theme;

@safe:
import models.cms;

class DCMSTheme : DCMSEntity {
  mixin(EntityThis!("CMSTheme"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .addAttributes([
        "themeId": UUIDAttribute
      ]) 
      .registerPath("cms_themes");
  }
}
mixin(EntityCalls!("CMSTheme"));
