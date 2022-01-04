module models.cms.entities.page;

@safe:
import models.cms;

class DCMSPage : DCMSEntity {
  mixin(EntityThis!("CMSPage"));

  override void initialize() {
    super.initialize;

    this
    .attribute("keywords", OOPAttributeTags) 
    .attribute("isPrivate", OOPAttributeBoolean) 
    .attribute("page", OOPAttributeUUID)
    .attribute("url", OOPAttributeString);
  }

  override DOOPEntity clone() { return CMSPage; }

  static string namespace = moduleName!DCMSPage;
  override string entityPath() { return "cms/page"; }
  override string entityClass() { return "cmsPage"; }
  override string entityClasses() { return "cmsPages"; }   
}
mixin(EntityCalls!("CMSPage"));
