module models.cms.entities.blog;

@safe:
import models.cms;

class DCMSBlog : DCMSPost {
  mixin(OOPEntityThis!("CMSBlog"));

  // This blog ist linked to blog
  mixin(SProperty!("UUID", "blog"));
  unittest {
    version(test_model_cms) {
      // TOD Add Tests
    }}

  override DOOPEntity clone() { return CMSBlog; }

  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
    super.fromJson(aJson);
    
      foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "blog": this.blog(UUID(v.get!string)); break;
        default: break;
      }      
    } 
    return this; }
  unittest {
    version(test_model_cms) {
      // TOD Add Tests
    }}

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    // debug writeln(moduleName!DCMSBlog~":DCMSBlog::toJson");    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("blog")) result["blog"] = this.blog.toString;
    }
    else {
      if ((showFields.exist("blog")) && (!hideFields.exist("blog"))) result["blog"] = this.blog.toString;
    }
    
    return result; }
  unittest {
    version(test_model_cms) {
      // TOD Add Tests
    }}
}
mixin(OOPEntityCalls!("CMSBlog"));

