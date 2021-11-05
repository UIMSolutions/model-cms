module models.cms.entities.page;

@safe:
import models.cms;

static this() {
  createEntities[DCMSPage.namespace] = (Json json) => CMSPage(json); 
  createEntities["cmsPage"] = (Json json) => CMSPage(json); 
  createEntities["page"] = (Json json) => CMSPage(json); 
}

class DCMSPage : DCMSEntity {
  this() { super(); }
    this(Json newJson) {
        this(); this.fromJson(newJson);
  }

  static string namespace = moduleName!DCMSPage;
  override string entityPath() { return moduleName!DCMSPage; }
  override string entityClass() { return "cmsPage"; }
  override string entityClasses() { return "cmsPages"; }  
 
  mixin(SProperty!("UUID", "page"));
  mixin(SProperty!("string", "url"));
  mixin(SProperty!("string", "keywords"));  
  mixin(SProperty!("bool", "isPrivate"));

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);

    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "page": this.page(UUID(v.get!string)); break;
        case "url": this.url(v.get!string); break;
        case "keywords": this.keywords(v.get!string); break;
        case "isPrivate": this.isPrivate(v.get!bool); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("url")) result["url"] = this.url;
      if (!hideFields.exist("keywords")) result["keywords"] = this.keywords;
      if (!hideFields.exist("isPrivate")) result["isPrivate"] = this.isPrivate;
    }
    else {
      if ((showFields.exist("keywords")) && (!hideFields.exist("keywords"))) result["keywords"] = this.keywords;
      if ((showFields.exist("url")) && (!hideFields.exist("url"))) result["url"] = this.url;
      if ((showFields.exist("isPrivate")) && (!hideFields.exist("isPrivate"))) result["isPrivate"] = this.isPrivate;
    }
    
    return result;
  }
}
auto CMSPage() { return new DCMSPage; }
auto CMSPage(Json json) { return new DCMSPage(json); }