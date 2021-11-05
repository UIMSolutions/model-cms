module models.cms.entities.theme;

@safe:
import models.cms;

static this() {
  createEntities[DCMSTheme.namespace] = (Json json) => CMSTheme(json); 
  createEntities["cmsTheme"] = (Json json) => CMSTheme(json); 
  createEntities["theme"] = (Json json) => CMSTheme(json); 
}

class DCMSTheme : DCMSEntity {
  this() { super(); this.pool("themes"); }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  static string namespace = moduleName!DCMSTheme;
  override string entityPath() { return moduleName!DCMSTheme; }
  override string entityClass() { return "cmsTheme"; }
  override string entityClasses() { return "cmsThemes"; }  
 
  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    /* foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "summary": this.summary(v.get!string); break;
        case "keywords": this.keywords(v.get!(Json[]).map!(a => a.get!string).array); break;
        case "text": this.text(v.get!string); break;
        default: break;
      }      
    } */
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
   /*  if (showFields.length == 0) {
      if (!hideFields.exist("summary")) result["summary"] = this.summary;
      if (!hideFields.exist("keywords")) result["keywords"] = this.keywords.serializeToJson;
      if (!hideFields.exist("text")) result["text"] = this.text;
    }
    else {
      if ((showFields.exist("summary")) && (!hideFields.exist("summary"))) result["summary"] = this.summary;
      if ((showFields.exist("keywords")) && (!hideFields.exist("keywords"))) result["keywords"] = this.keywords.serializeToJson;
      if ((showFields.exist("text")) && (!hideFields.exist("text"))) result["text"] = this.text;
    } */
    
    return result;
  }
}
auto CMSTheme() { return new DCMSTheme; }
auto CMSTheme(Json json) { return new DCMSTheme(json); }