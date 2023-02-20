module models.cms.entities.docu;

@safe:
import models.cms;

class DCMSDocu : DCMSPost {
  mixin(EntityThis!("CMSDocu"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    
    this
      .addAttributes([
        "docu": UUIDAttribute
      ]) 
    .registerPath("cms_docus");
  }
}
mixin(EntityCalls!("CMSDocu"));

version(test_model_cms) {
  unittest { // Test attribute "docu"
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
