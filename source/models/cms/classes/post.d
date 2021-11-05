module models.cms.classes.post;

@safe:
import models.cms;

class DCMSPost : DCMSEntity {
  this() { super(); }
  this(Json newJson) { super(newJson); }

  static string namespace = moduleName!DCMSPost;
  override string entityPath() { return moduleName!DCMSPost; }
  override string entityClass() { return "cmsPost"; }
  override string entityClasses() { return "cmsPosts"; }  

  mixin(SProperty!("string[]", "keywords"));
  O keywords(this O)(string values) {
    _keywords = split("#").map!(a => a.strip).join(",").split(",").map!(a => a.strip).array;
    return cast(O)this;
  }
  mixin(SProperty!("string", "link"));

  mixin(SProperty!("bool", "isPrivate"));
  O isPrivate(this O)(string newValue) {
    this.isPrivate(newValue == "true");
    return cast(O)this;
  }
  
  mixin(SProperty!("UUID", "theme"));
  O theme(this O)(string anUuid) { 
    this.theme(UUID(anUuid)); 
    return cast(O)this;
  }

  override string opIndex(string key) {
    switch(key) {
      case "keywords": return this.keywords.join(","); 
      case "isPrivate": return this.isPrivate ? "true" : "false"; 
      case "theme": return this.theme.toString;
      case "link": return this.link;
      default: return super.opIndex(key);
    }      
  }

  // Read HTML value and set entity value
  override void opIndexAssign(string value, string key) {
    switch(key) {
      case "keywords": this.keywords(value); break;
      case "isPrivate": this.isPrivate(value); break;
      case "theme": this.theme(value); break;
      case "link": this.link(value); break;
      default: super.opIndexAssign(value, key); break;
    }      
  }

  override void fromRequest(STRINGAA parameters) {
    super.fromRequest(parameters);
    foreach(k, v; [
      "entity_keywords":"keywords", 
      "entity_isprivate":"isPrivate", 
      "entity_theme":"theme"]) {
      if (k in parameters) this[v] = parameters[k];
    }
  }

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "theme": this.theme(UUID(v.get!string)); break;
        case "keywords":
          if (v == Json.string) this.keywords(v.get!string); 
          else this.keywords(v.get!string[]); break;
        case "isPrivate": this.isPrivate(v.get!bool); break;
        default: break;
      }      
    }
  }
 
  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("theme")) result["theme"] = this.theme.toString;
      if (!hideFields.exist("keywords")) result["keywords"] = this.keywords.toJson;
      if (!hideFields.exist("isPrivate")) result["isPrivate"] = this.isPrivate;
    }
    else {
      if ((showFields.exist("theme")) && (!hideFields.exist("theme"))) result["theme"] = this.theme.toString;
      if ((showFields.exist("keywords")) && (!hideFields.exist("keywords"))) result["keywords"] = this.keywords.toJson;
      if ((showFields.exist("isPrivate")) && (!hideFields.exist("isPrivate"))) result["isPrivate"] = this.isPrivate;
    }
    
    return result;
  }
}
auto CMSPost() { return new DCMSPost; }
auto CMSPost(Json json) { return new DCMSPost(json); }

