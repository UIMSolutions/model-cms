module models.cms.entities.theme;

@safe:
import models.cms;

class DCMSTheme : DCMSEntity {
  mixin(EntityThis!("CMSTheme"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "themeId": UUIDAttribute
      ]) 
      .registerPath("cms_themes");
  }
}
mixin(EntityCalls!("CMSTheme"));
