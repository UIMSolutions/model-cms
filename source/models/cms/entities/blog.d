module models.cms.entities.blog;

@safe:
import models.cms;

class DCMSBlog : DCMSPost {
  this() { super(); this.pool("blogs"); }
  this(Json newJson) {
      this(); this.fromJson(newJson); }

  static string namespace = moduleName!DCMSBlog;
  override string entityPath() { return "cms/blog"; }
  override string entityClass() { return "cmsBlog"; }
  override string entityClasses() { return "cmsBlogs"; }  
  
  // This blog ist linked to blog
  mixin(SProperty!("UUID", "blog"));
  unittest {
    version(model_cms) {
      // TOD Add Tests
    }}

  override DOOPEntity newEntity() { return CMSBlog; }

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
    version(model_cms) {
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
    version(model_cms) {
      // TOD Add Tests
    }}
}
auto CMSBlog() { return new DCMSBlog; }
auto CMSBlog(Json json) { return new DCMSBlog(json); }

