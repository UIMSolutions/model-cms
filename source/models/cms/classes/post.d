module models.cms.classes.post;

@safe:
import models.cms;

class DCMSPost : DCMSEntity {
  mixin(EntityThis!("CMSPost"));

  override void initialize() {
    super.initialize;

    this
    .attribute("keywords", OOPAttributeTags) 
    .attribute("link", OOPAttributeString)
    .attribute("isPrivate", OOPAttributeBoolean) 
    .attribute("themeId", OOPAttributeUUID); 
  }

  static string namespace = moduleName!DCMSPost;
  override string entityPath() { return moduleName!DCMSPost; }
  override string entityClass() { return "cmsPost"; }
  override string entityClasses() { return "cmsPosts"; }  

  mixin(OProperty!("DCMSTheme", "theme"));

  string[] keywords() { 
    if (auto attribute = cast(DOOPAttributeTags)attributes["keywords"]) {
      return attribute.value; } 
    return null;
  }

  O keywords(this O)(string[] values) { 
    if (auto attribute = cast(DOOPAttributeTags)attributes["keywords"]) {
      attribute.value(values); } 
    return cast(O)this;
  }

  override DOOPEntity fromRequest(STRINGAA parameters) {
    super.fromRequest(parameters);
    foreach(k, v; [
      "entity_keywords":"keywords", 
      "entity_isprivate":"isPrivate", 
      "entity_theme":"themeId"]) {
      if (k in parameters) this[v] = parameters[k];
    }
    return this;
  }

  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "theme": this["themeId"] = v.get!string; break;
        default: break;
      }      
    }
    return this;
  }
}
mixin(EntityCalls!("CMSPost"));

unittest { // Test attribute "isPrivate"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["isPrivate"] = "true";
    assert(entity["isPrivate"] == "true"); 
    
    entity["isPrivate"] = "false";
    assert(entity["isPrivate"] == "false"); 

    auto json = Json.emptyObject;
    json["isPrivate"] = false;
    writeln(json);
    entity.fromJson(json);
    assert(entity["isPrivate"] == "false"); 

    json["isPrivate"] = true;
    writeln(json);
    entity.fromJson(json);
    assert(entity["isPrivate"] == "true"); 

    assert("isPrivate" in entity.toJson);
    assert(entity.toJson["isPrivate"].get!bool);
    entity["isPrivate"] = "false"; 
    assert(!entity.toJson["isPrivate"].get!bool);
   }
}

unittest {  // Test attribute "keywords"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["keywords"] = "one,two,three";
    assert(entity["keywords"] == "one,two,three"); 
    
    entity["keywords"] = "one, three";
    assert(entity["keywords"] == "one,three"); 

    entity["keywords"] = "one,two #three";
    debug writeln(entity["keywords"]); 
    assert(entity["keywords"] == "one,two,three"); 
    
    entity["keywords"] = ",one,three";
    assert(entity["keywords"] == "one,three"); 

    auto json = Json.emptyObject;
    auto tags = Json.emptyArray;
    tags ~= "one";
    tags ~= "two";
    tags ~= "three";
    json["keywords"] = tags;
    entity.fromJson(json);
    assert(entity["keywords"] == "one,two,three"); 
  }
}

unittest { // Test attribute "link"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["link"] = "something";
    assert(entity["link"] == "something"); 
    
    entity["link"] = "nothing";
    assert(entity["link"] == "nothing"); 

    auto json = Json.emptyObject;
    json["link"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["link"] == "nothing"); 

    json["link"] = "something";
    entity.fromJson(json);
    assert(entity["link"] == "something"); 

    assert("link" in entity.toJson);
    assert(entity.toJson["link"].get!string == "something");
  }
}

unittest { // Test attribute "theme"
  version(test_model_cms) {
    auto entity = CMSPost;

    // TODO Add Test
/*  entity["theme"] = "something";
    assert(entity["theme"] == "something"); 
    
    entity["theme"] = "nothing";
    assert(entity["theme"] == "nothing"); 

    auto json = Json.emptyObject;
    json["theme"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["theme"] == "nothing"); 

    json["theme"] = "something";
    entity.fromJson(json);
    assert(entity["theme"] == "something"); 

    assert("theme" in entity.toJson);
    assert(entity.toJson["theme"].get!string == "something"); */
  }
}