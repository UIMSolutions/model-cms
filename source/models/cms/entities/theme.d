module models.cms.entities.theme;

@safe:
import models.cms;

class DCMSTheme : DCMSEntity {
  mixin(EntityThis!("CMSTheme"));

  override void initialize() {
    super.initialize;

    this
      .addValues([
        "themeId": UUIDAttribute
      ]) 
      .registerPath("cms_themes");
  }
}
mixin(EntityCalls!("CMSTheme"));
