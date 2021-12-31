module models.cms.entities.docu;

@safe:
import models.cms;

class DCMSDocu : DCMSPost {
  this() { super(); 
    this
    .pool("docus")
    .attribute("docu", OOPAttributeUUID); }

  this(Json newJson) {
    this(); 
    this.fromJson(newJson); }

  override DOOPEntity newEntity() { return CMSDocu; }

  static string namespace = moduleName!DCMSDocu;
  override string entityPath() { return "cms/docu"; }
  override string entityClass() { return "cmsDocu"; }
  override string entityClasses() { return "cmsDocus"; }  
}
auto CMSDocu() { return new DCMSDocu; }
auto CMSDocu(Json json) { return new DCMSDocu(json); }

unittest { // Test attribute "docu"
  version(model_cms) {
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
