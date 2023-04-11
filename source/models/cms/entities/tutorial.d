module models.cms.entities.tutorial;

@safe:
import models.cms;

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

