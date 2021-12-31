module models.cms.entities.offer;

@safe:
import models.cms;

class DCMSOffer : DCMSPost {
  this() { super(); 
    this
    .pool("offers")
    .attribute("offer", OOPAttributeUUID); }

  this(Json newJson) {
    this(); 
    this
    .fromJson(newJson);
  }

  static string namespace = moduleName!DCMSOffer;
  override string entityPath() { return "cms/offer"; }
  override string entityClass() { return "cmsOffer"; }
  override string entityClasses() { return "cmsOffer"; }  

  override DOOPEntity newEntity() { return CMSOffer; }
}
auto CMSOffer() { return new DCMSOffer; }
auto CMSOffer(Json json) { return new DCMSOffer(json); }
