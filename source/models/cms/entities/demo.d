module models.cms.entities.demo;

@safe:
import models.cms;

class DCMSDemo : DCMSPost {
  mixin(OOPEntityThis!("CMSDemo"));

  mixin(SProperty!("UUID", "demo"));

  override DOOPEntity clone() { return CMSDemo; }
  
  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
    super.fromJson(aJson);
    
     foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "demo": this.demo(UUID(v.get!string)); break;
        default: break;
      }      
    } 
    return this;
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("demo")) result["demo"] = this.demo.toString;
    }
    else {
      if ((showFields.exist("demo")) && (!hideFields.exist("demo"))) result["demo"] = this.demo.toString;
    }
    
    return result;
  }
}
mixin(OOPEntityCalls!("CMSDemo"));


