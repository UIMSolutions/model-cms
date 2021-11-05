module models.cms.entities.docu;

@safe:
import models.cms;

static this() {
  createEntities[DCMSDocu.namespace] = (Json json) => CMSDocu(json); 
  createEntities["cmsDocu"] = (Json json) => CMSDocu(json); 
  createEntities["docu"] = (Json json) => CMSDocu(json); 
}

class DCMSDocu : DCMSPost {
  this() { super(); this.pool("docus"); }
    this(Json newJson) {
        this(); this.fromJson(newJson);
    }

  static string namespace = moduleName!DCMSDocu;
  override string entityPath() { return moduleName!DCMSDocu; }
  override string entityClass() { return "cmsDocu"; }
  override string entityClasses() { return "cmsDocus"; }  
    
   mixin(SProperty!("UUID", "docu"));

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "docu": this.docu(UUID(v.get!string)); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("docu")) result["docu"] = this.docu.toString;
    }
    else {
      if ((showFields.exist("docu")) && (!hideFields.exist("docu"))) result["docu"] = this.theme.toString;
    }
    
    return result;
  }
}
auto CMSDocu() { return new DCMSDocu; }
auto CMSDocu(Json json) { return new DCMSDocu(json); }
