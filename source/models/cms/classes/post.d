module models.cms.classes.post;

import models.cms;

@safe:
class DCMSPost : DCMSEntity {
  mixin(EntityThis!("CMSPost"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "keywords": TagsAttribute, 
        "link": StringAttribute,
        "isPrivate": BooleanAttribute, 
        "themeId": UUIDAttribute
      ]); 
  }

  mixin(OProperty!("DCMSTheme", "theme"));

  string[] keywords() { 
    if (auto myValue = cast(DTagArrayValue)this.values["keywords"]) {
      return myValue.value; } 
    return null;
  }

  O keywords(this O)(string[] newValues) { 
    if (auto myValue = cast(DTagArrayValue)this.values["keywords"]) {
      myValue.value(newValues); } 
    return cast(O)this;
  }

  override void readFromRequest(STRINGAA parameters, bool usePrefix = true) {
    super.readFromRequest(parameters, usePrefix);
    foreach(k, v; [
      "entity_keywords":"keywords", 
      "entity_isprivate":"isPrivate", 
      "entity_theme":"themeId"]) {
      if (k in parameters) this[v] = parameters[k];
    }
  }

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);

    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key.toLower;
      auto v = keyvalue.value;
      switch(k) {
        case "theme": this["themeId"] = v.get!string; break;
        case "isprivate": this["isPrivate"] = v.get!bool; break;
        default: break;
      }      
    }
  }
}
mixin(EntityCalls!("CMSPost"));

///
unittest { // Test attribute "isPrivate"
  auto entity = new DCMSPost;
  assert(cast(DBooleanValue)entity.values["isPrivate"]);

  entity["isPrivate"] = "true";
  assert(entity["isPrivate"] == "true"); 
  
  entity["isPrivate"] = "false";
  assert(entity["isPrivate"] == "false"); 

  auto json = Json.emptyObject;
  json["isPrivate"] = false;

  entity.fromJson(json);
  assert(entity["isPrivate"] == "false"); 

  json["isPrivate"] = true;
  entity.fromJson(json);
  assert(entity["isPrivate"] == "true"); 

  assert("isPrivate" in entity.toJson);
  assert(entity.toJson["isPrivate"].get!bool);
  entity["isPrivate"] = "false"; 
  assert(!entity.toJson["isPrivate"].get!bool); 
}

unittest {  // Test attribute "keywords"
    auto entity = CMSPost;
    entity["keywords"] = "#one#two#three";
    assert(entity["keywords"] == "#one#two#three"); 
    
    entity["keywords"] = "#one #two #three";
    assert(entity["keywords"] == "#one#two#three"); 
    
    auto json = Json.emptyObject;
    auto tags = Json.emptyArray;
    tags ~= "one";
    tags ~= "two";
    tags ~= "three";
    json["keywords"] = tags;
    entity.fromJson(json);
    assert(entity["keywords"] == "#one#two#three"); 
}

unittest { // Test attribute "link"
    auto entity = CMSPost;
    entity["link"] = "something";
    assert(entity["link"] == "something"); 
    
    entity["link"] = "nothing";
    assert(entity["link"] == "nothing"); 

    auto json = Json.emptyObject;
    json["link"] = "nothing";
    debug writeln(json);
    entity.fromJson(json);
    assert(entity["link"] == "nothing"); 

    json["link"] = "something";
    entity.fromJson(json);
    assert(entity["link"] == "something"); 

    assert("link" in entity.toJson);
    assert(entity.toJson["link"].get!string == "something");
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