module models.cms.entities.theme;

@safe:
import models.cms;

class DCMSTheme : DCMSEntity {
  mixin(EntityThis!("CMSTheme"));

  static string namespace = moduleName!DCMSTheme;
  override string entityPath() { return "cms/theme"; }
  override string entityClass() { return "cmsTheme"; }
  override string entityClasses() { return "cmsThemes"; }  
 
  override DOOPEntity clone() { return CMSTheme; }

  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
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
    return this;
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
mixin(EntityCalls!("CMSTheme"));
