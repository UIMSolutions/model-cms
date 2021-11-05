module models.cms.classes.entity;

@safe:
import models.cms;

class DCMSEntity : DOOPEntity {
  this() { super(); this.isIndex(false); }
  this(Json newJson) {
      this(); this.fromJson(newJson);
  }

  mixin(SProperty!("string", "image"));
  mixin(SProperty!("bool", "isIndex"));
  O isIndex(this O)(string newValue) {
    this.isIndex(newValue == "true");
    return cast(O)this;
  }

  mixin(SProperty!("string", "mainTitle"));
  mixin(SProperty!("string", "subTitle"));
  mixin(SProperty!("string", "summary"));
  mixin(SProperty!("string", "text"));

  override string opIndex(string key) {
    switch(key) {
      case "image": return this.image; 
      case "isIndex": return this.isIndex ? "true" : "false"; 
      case "mainTitle": return this.mainTitle;
      case "subTitle": return this.subTitle;
      case "summary": return this.summary;
      case "text": return this.text;
      default: return super.opIndex(key);
    }      
  }

  // Read HTML value and set entity value
  override void opIndexAssign(string value, string key) {
    switch(key) {
      case "image": this.image(value); break;
      case "isIndex": this.isIndex(value); break;
      case "mainTitle": this.mainTitle(value); break;
      case "subTitle": this.subTitle(value); break;
      case "summary": this.summary(value); break;
      case "text": this.text(value); break;
      default: super.opIndexAssign(value, key); break;
    }      
  }

  override void fromRequest(STRINGAA parameters) {
    super.fromRequest(parameters);
    foreach(k, v; [
      "entity_image":"image", 
      "entity_isindex":"isIndex", 
      "entity_maintitle":"mainTitle", 
      "entity_subtitle":"subTitle", 
      "entity_summary":"summary", 
      "entity_text":"text"]) {
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
        case "summary": this.summary(v.get!string); break;
        case "text": this.text(v.get!string); break;
        case "mainTitle": this.mainTitle(v.get!string); break;
        case "subTitle": this.subTitle(v.get!string); break;
        case "image": this.image(v.get!string); break;
        case "isIndex": this.isIndex(v.get!bool); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("summary")) result["summary"] = this.summary;
      if (!hideFields.exist("text")) result["text"] = this.text;
      if (!hideFields.exist("image")) result["image"] = this.image;
      if (!hideFields.exist("mainTitle")) result["mainTitle"] = this.mainTitle;
      if (!hideFields.exist("subTitle")) result["subTitle"] = this.subTitle;
      if (!hideFields.exist("isIndex")) result["isIndex"] = this.isIndex;
    }
    else {
      if ((showFields.exist("summary")) && (!hideFields.exist("summary"))) result["summary"] = this.summary;
      if ((showFields.exist("text")) && (!hideFields.exist("text"))) result["text"] = this.text;
      if ((showFields.exist("image")) && (!hideFields.exist("image"))) result["image"] = this.image;
      if ((showFields.exist("mainTitle")) && (!hideFields.exist("mainTitle"))) result["mainTitle"] = this.mainTitle;
      if ((showFields.exist("subTitle")) && (!hideFields.exist("subTitle"))) result["subTitle"] = this.subTitle;
      if ((showFields.exist("isIndex")) && (!hideFields.exist("isIndex"))) result["isIndex"] = this.isIndex;
    }
    
    return result;
  }
}
auto CMSEntity() { return new DCMSEntity; }
auto CMSEntity(Json json) { return new DCMSEntity(json); }