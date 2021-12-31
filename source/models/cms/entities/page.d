module models.cms.entities.page;

@safe:
import models.cms;

class DCMSPage : DCMSEntity {
  this() { super(); 
    this
    .attribute("keywords", OOPAttributeTags) 
    .attribute("isPrivate", OOPAttributeBoolean) 
    .attribute("page", OOPAttributeUUID)
    .attribute("url", OOPAttributeString);
  }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  override DOOPEntity newEntity() { return CMSPage; }

  static string namespace = moduleName!DCMSPage;
  override string entityPath() { return "cms/page"; }
  override string entityClass() { return "cmsPage"; }
  override string entityClasses() { return "cmsPages"; }   
}
auto CMSPage() { return new DCMSPage; }
auto CMSPage(Json json) { return new DCMSPage(json); }