module models.cms.entities.glossary_item;

@safe:
import models.cms;

class DCMSGlossaryItem : DCMSPost {
  mixin(OOPEntityThis!("CMSGlossaryItem"));

//    mixin(SProperty!("UUID", "glossary_item"));

  override DOOPEntity clone() { return CMSGlossaryItem; }
  
  override DOOPEntity fromJson(Json aJson) {
    if (aJson == Json(null)) return this;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
//        case "glossary_item": this.glossary_item(UUID(v.get!string)); break;
        default: break;
      }      
    }
    return this;
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
mixin(OOPEntityCalls!("CMSGlossaryItem"));

