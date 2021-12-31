module models.cms.entities.tutorial;

@safe:
import models.cms;

class DCMSTutorial : DCMSPost {
  this() { super(); this.pool("tutorials"); }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  static string namespace = moduleName!DCMSTutorial;
  override string entityPath() { return "cms/tutorial"; }
  override string entityClass() { return "cmsTutorial"; }
  override string entityClasses() { return "cmsTutorials"; }  

  mixin(SProperty!("UUID", "tutorial"));

  override DOOPEntity newEntity() { return CMSTutorial; }

  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "tutorial": this.tutorial(UUID(v.get!string)); break;
        default: break;
      }      
    }
    return this;
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
