module models.cms.entities.blog;

@safe:
import models.cms;

static this() {
  createEntities[DCMSBlog.namespace] = (Json json) => CMSBlog(json); 
  createEntities["cmsBlog"] = (Json json) => CMSBlog(json); 
  createEntities["blog"] = (Json json) => CMSBlog(json); 
}

class DCMSBlog : DCMSPost {
  this() { super(); this.pool("blogs"); }
  this(Json newJson) {
      this(); this.fromJson(newJson); }

  static string namespace = moduleName!DCMSBlog;
  override string entityPath() { return moduleName!DCMSBlog; }
  override string entityClass() { return "cmsBlog"; }
  override string entityClasses() { return "cmsBlogs"; }  
  mixin(SProperty!("UUID", "blog"));

  override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
      foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "blog": this.blog(UUID(v.get!string)); break;
        default: break;
      }      
    } 
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("blog")) result["blog"] = this.blog.toString;
    }
    else {
      if ((showFields.exist("blog")) && (!hideFields.exist("blog"))) result["blog"] = this.blog.toString;
    }
    
    return result;
  }
}
auto CMSBlog() { return new DCMSBlog; }
auto CMSBlog(Json json) { return new DCMSBlog(json); }

