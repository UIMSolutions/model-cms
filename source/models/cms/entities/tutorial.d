module models.cms.entities.tutorial;

import models.cms;

@safe:
class DCMSTutorial : DCMSPost {
  mixin(EntityThis!("CMSTutorial"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "tutorialId": UUIDAttribute
      ]) 
      .registerPath("cms_tutorials")
      .routingPath("/cms/tutorials");
  }
}
mixin(EntityCalls!("CMSTutorial"));

