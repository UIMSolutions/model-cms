module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  mixin(EntityThis!("CMSLink"));

  override DOOPEntity clone() { return CMSLink; }

  static string namespace = moduleName!DCMSLink;
  override string entityPath() { return "cms/link"; }
  override string entityClass() { return "cmsLink"; }
  override string entityClasses() { return "cmsLinks"; }  
}
mixin(EntityCalls!("CMSLink"));


