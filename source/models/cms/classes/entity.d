module models.cms.classes.entity;

import models.cms;

@safe:
class DCMSEntity : DEntity {
  mixin(EntityThis!("CMSEntity"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .addValues([
        "imagePath": StringAttribute,
        "mainTitle": StringAttribute,
        "subTitle": StringAttribute,
        "summary": StringAttribute,
        "text": StringAttribute,
        "isIndex": BooleanAttribute
      ]); 
 
    this["isIndex"] = "nothing"; 
  }

  override void readFromRequest(STRINGAA parameters, bool usePrefix = true) {
    super.readFromRequest(parameters, usePrefix);
    foreach(k, v; [
      "entity_imagepath":"imagePath", 
      "entity_isindex":"isIndex", 
      "entity_maintitle":"mainTitle", 
      "entity_subtitle":"subTitle", 
      "entity_summary":"summary", 
      "entity_text":"text"]) {
      if (k in parameters) this[v] = parameters[k];
    }
  }
  unittest {

  }
}
mixin(EntityCalls!("CMSEntity"));

unittest { // Test attribute "imagePath"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["imagePath"] = "something";
    assert(entity["imagePath"] == "something"); 
    
    entity["imagePath"] = "nothing";
    assert(entity["imagePath"] == "nothing"); 

    auto json = Json.emptyObject;
    json["imagePath"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["imagePath"] == "nothing"); 

    json["imagePath"] = "something";
    entity["imagePath"] = json.get!string;
    assert(entity["imagePath"] == "something"); 

    assert("imagePath" in entity.toJson);
    assert(entity.toJson["imagePath"].get!string == "something");
  }
}

unittest { // Test attribute "isIndex"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["isIndex"] = "true";
    assert(entity["isIndex"] == "true"); 
    
    entity["isIndex"] = "false";
    assert(entity["isIndex"] == "false"); 

    auto json = Json.emptyObject;
    json["isIndex"] = false;
    writeln(json);
    entity.fromJson(json);
    assert(entity["isIndex"] == "false"); 

    json["isIndex"] = true;
    entity.fromJson(json);
    assert(entity["isIndex"] == "true"); 

    assert("isIndex" in entity.toJson);
    assert(entity.toJson["isIndex"].get!bool == true);
    }}

unittest { // Test attribute "maintitle"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["mainTitle"] = "something";
    assert(entity["mainTitle"] == "something"); 
    
    entity["mainTitle"] = "nothing";
    assert(entity["mainTitle"] == "nothing"); 

    auto json = Json.emptyObject;
    json["mainTitle"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["mainTitle"] == "nothing"); 

    json["mainTitle"] = "something";
    entity.fromJson(json);
    assert(entity["mainTitle"] == "something"); 

    assert("mainTitle" in entity.toJson);
    assert(entity.toJson["mainTitle"].get!string == "something");
  }
}

unittest { // Test attribute "subTitle"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["subTitle"] = "something";
    assert(entity["subTitle"] == "something"); 
    
    entity["subTitle"] = "nothing";
    assert(entity["subTitle"] == "nothing"); 

    auto json = Json.emptyObject;
    json["subTitle"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["subTitle"] == "nothing"); 

    json["subTitle"] = "something";
    entity.fromJson(json);
    assert(entity["subTitle"] == "something"); 

    assert("subTitle" in entity.toJson);
    assert(entity.toJson["subTitle"].get!string == "something");
  }
}

unittest { // Test attribute "summary"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["summary"] = "something";
    assert(entity["summary"] == "something"); 
    
    entity["summary"] = "nothing";
    assert(entity["summary"] == "nothing"); 

    auto json = Json.emptyObject;
    json["summary"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["summary"] == "nothing"); 

    json["summary"] = "something";
    entity.fromJson(json);
    assert(entity["summary"] == "something"); 

    assert("summary" in entity.toJson);
    assert(entity.toJson["summary"].get!string == "something");
  }
}

unittest { // Test attribute "text"
  version(test_model_cms) {
    auto entity = CMSPost;
    entity["text"] = "something";
    assert(entity["text"] == "something"); 
    
    entity["text"] = "nothing";
    assert(entity["text"] == "nothing"); 

    auto json = Json.emptyObject;
    json["text"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["text"] == "nothing"); 

    json["text"] = "something";
    entity.fromJson(json);
    assert(entity["text"] == "something"); 

    assert("text" in entity.toJson);
    assert(entity.toJson["text"].get!string == "something");
  }
}