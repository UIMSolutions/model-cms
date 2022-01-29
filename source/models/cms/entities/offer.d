module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  mixin(OOPEntityThis!("CMSOffer"));

  override void initialize() {
    super.initialize;

    this
    .attribute("offer", OOPAttributeUUID); 
  }

  override DOOPEntity clone() { return CMSOffer; }
}
mixin(OOPEntityCalls!("CMSOffer"));
