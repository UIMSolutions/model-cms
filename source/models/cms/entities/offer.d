module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  mixin(EntityThis!("CMSOffer"));

  override void initialize() {
    super.initialize;

    this
    .attribute("offer", OOPAttributeUUID); 
  }

  static string namespace = moduleName!DCMSOffer;
  override string entityPath() { return "cms/offer"; }
  override string entityClass() { return "cmsOffer"; }
  override string entityClasses() { return "cmsOffer"; }  

  override DOOPEntity clone() { return CMSOffer; }
}
mixin(EntityCalls!("CMSOffer"));
