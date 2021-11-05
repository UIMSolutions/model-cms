module models.cms.entities.news;

@safe:
import models.cms;

static this() {
  createEntities[DCMSNewsItem.namespace] = (Json json) => CMSNewsItem(json); 
  createEntities["cmsNewsItem"] = (Json json) => CMSNewsItem(json); 
  createEntities["newsItem"] = (Json json) => CMSNewsItem(json); 
}

class DCMSNewsItem : DCMSPost {
  this() { super(); this.pool("news"); }
    this(Json newJson) {
        this(); this.fromJson(newJson);
  }

  static string namespace = moduleName!DCMSNewsItem;
  override string entityPath() { return moduleName!DCMSNewsItem; }
  override string entityClass() { return "cmsNewsItem"; }
  override string entityClasses() { return "cmsNewsItems"; }  

    
  mixin(SProperty!("UUID", "news"));

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "news": this.news(UUID(v.get!string)); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("news")) result["news"] = this.news.toString;
    }
    else {
      if ((showFields.exist("news")) && (!hideFields.exist("news"))) result["news"] = this.news.toString;
    }
    
    return result;
  }
}
auto CMSNewsItem() { return new DCMSNewsItem; }
auto CMSNewsItem(Json json) { return new DCMSNewsItem(json); }
