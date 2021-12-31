module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  this() { super(); this.pool("links"); }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  override DOOPEntity newEntity() { return CMSLink; }

  static string namespace = moduleName!DCMSLink;
  override string entityPath() { return "cms/link"; }
  override string entityClass() { return "cmsLink"; }
  override string entityClasses() { return "cmsLinks"; }  
}
auto CMSLink() { return new DCMSLink; }
auto CMSLink(Json json) { return new DCMSLink(json); }

