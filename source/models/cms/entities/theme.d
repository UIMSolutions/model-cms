module models.cms.entities.theme;

@safe:
import models.cms;

class DCMSTheme : DCMSEntity {
  mixin(OOPEntityThis!("CMSTheme"));

    override void initialize() {
    super.initialize;

    this
      .attribute("themeId", OOPUUIDAttribute) 
      .registerPath("cms_themes");
  }
}
mixin(OOPEntityCalls!("CMSTheme"));
