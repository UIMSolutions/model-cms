module models.cms.entities.tutorial;

@safe:
import models.cms;

class DCMSTutorial : DCMSPost {
  mixin(OOPEntityThis!("CMSTutorial"));

  override void initialize() {
    super.initialize;

    this
      .attribute("tutorialId", OOPUUIDAttribute) 
      .registerPath("cms_tutorials");
  }
}
mixin(OOPEntityCalls!("CMSTutorial"));

