module models.cms.entities.docu;

@safe:
import models.cms;

class DCMSDocu : DCMSPost {
  mixin(OOPEntityThis!("CMSDocu"));

  override void initialize() {
    super.initialize;
    
    this
    .attribute("docu", OOPAttributeUUID); 
  }

  override DOOPEntity clone() { return CMSDocu; }
}
mixin(OOPEntityCalls!("CMSDocu"));


unittest { // Test attribute "docu"
  version(test_model_cms) {
    auto entity = CMSPost;

    // TOD Add Test
/*     entity["docu"] = "something";
    assert(entity["docu"] == "something"); 
    
    entity["docu"] = "nothing";
    assert(entity["docu"] == "nothing"); 

    auto json = Json.emptyObject;
    json["docu"] = "nothing";
    writeln(json);
    entity.fromJson(json);
    assert(entity["docu"] == "nothing"); 

    json["docu"] = "something";
    entity.fromJson(json);
    assert(entity["docu"] == "something"); 

    assert("docu" in entity.toJson);
    assert(entity.toJson["docu"].get!string == "something"); */
  }
}
