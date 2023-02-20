module models.cms.entities.tutorial;

@safe:
import models.cms;

class DCMSTutorial : DCMSPost {
  mixin(EntityThis!("CMSTutorial"));

  override void initialize() {
    super.initialize(configSettings);

    this
      .addValues([
        "tutorialId": UUIDAttribute
      ]) 
      .registerPath("cms_tutorials");
  }
}
mixin(EntityCalls!("CMSTutorial"));

