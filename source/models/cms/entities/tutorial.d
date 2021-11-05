module models.cms.entities.tutorial;

@safe:
import models.cms;

static this() {
  createEntities[DCMSTutorial.namespace] = (Json json) => CMSTutorial(json); 
  createEntities["cmsTutorial"] = (Json json) => CMSTutorial(json); 
  createEntities["tutorial"] = (Json json) => CMSTutorial(json); 
}

class DCMSTutorial : DCMSPost {
  this() { super(); this.pool("tutorials"); }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  static string namespace = moduleName!DCMSTutorial;
  override string entityPath() { return moduleName!DCMSTutorial; }
  override string entityClass() { return "cmsTutorial"; }
  override string entityClasses() { return "cmsTutorials"; }  

  mixin(SProperty!("UUID", "tutorial"));

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "tutorial": this.tutorial(UUID(v.get!string)); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("tutorial")) result["tutorial"] = this.tutorial.toString;
    }
    else {
      if ((showFields.exist("tutorial")) && (!hideFields.exist("tutorial"))) result["tutorial"] = this.tutorial.toString;
    }
    
    return result;
  }
}
auto CMSTutorial() { return new DCMSTutorial; }
auto CMSTutorial(Json json) { return new DCMSTutorial(json); }
