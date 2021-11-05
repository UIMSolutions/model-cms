module models.cms.entities.link;

@safe:
import models.cms;

static this() {
  createEntities[DCMSLink.namespace] = (Json json) => CMSLink(json); 
  createEntities["cmsLink"] = (Json json) => CMSLink(json); 
  createEntities["link"] = (Json json) => CMSLink(json); 
}

class DCMSLink : DCMSPost {
  this() { super(); this.pool("links"); }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  static string namespace = moduleName!DCMSLink;
  override string entityPath() { return moduleName!DCMSLink; }
  override string entityClass() { return "cmsLink"; }
  override string entityClasses() { return "cmsLinks"; }  
}
auto CMSLink() { return new DCMSLink; }
auto CMSLink(Json json) { return new DCMSLink(json); }

