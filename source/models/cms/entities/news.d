module models.cms.entities.news;

@safe:
import models.cms;


class DCMSNewsItem : DCMSPost {
  mixin(OOPEntityThis!("CMSNewsItem"));

  mixin(SProperty!("UUID", "news"));

  override DOOPEntity clone() { return CMSNewsItem; }

  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "news": this.news(UUID(v.get!string)); break;
        default: break;
      }      
    }
    return this;
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
mixin(OOPEntityCalls!("CMSNewsItem"));



