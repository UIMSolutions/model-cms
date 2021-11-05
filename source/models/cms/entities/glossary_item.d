module models.cms.entities.glossary_item;

@safe:
import models.cms;

static this() {
  createEntities[DCMSGlossaryItem.namespace] = (Json json) => CMSGlossaryItem(json); 
  createEntities["cmsGlossaryItem"] = (Json json) => CMSGlossaryItem(json); 
  createEntities["glossaryItem"] = (Json json) => CMSGlossaryItem(json); 
}

class DCMSGlossaryItem : DCMSPost {
    this() { super(); this.pool("glossary_items"); }
    this(Json newJson) {
        this(); this.fromJson(newJson);
    }

  static string namespace = moduleName!DCMSGlossaryItem;
  override string entityPath() { return moduleName!DCMSGlossaryItem; }
  override string entityClass() { return "cmsGlossaryItem"; }
  override string entityClasses() { return "cmsGlossaryItems"; }  
    
//    mixin(SProperty!("UUID", "glossary_item"));

    override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
//        case "glossary_item": this.glossary_item(UUID(v.get!string)); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
//      if (!hideFields.exist("glossary_item")) result["glossary_item"] = this.glossary_item.toString;
    }
    else {
//      if ((showFields.exist("glossary_item")) && (!hideFields.exist("glossary_item"))) result["glossary_item"] = this.theme.toString;
    }
    
    return result;
  }
}
auto CMSGlossaryItem() { return new DCMSGlossaryItem; }
auto CMSGlossaryItem(Json json) { return new DCMSGlossaryItem(json); }
