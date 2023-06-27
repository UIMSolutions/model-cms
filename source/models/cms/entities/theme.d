module models.cms.entities.theme;

import models.cms;

@safe:
class DCMSTheme : DCMSEntity {
  mixin(EntityThis!("CMSTheme"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "themeId": UUIDAttribute
      ]) 
      .registerPath("cms_themes")
      .routingPath("/cms/themes");
  }
}
mixin(EntityCalls!("CMSTheme"));
