module models.cms.entities.offer;

@safe:
import models.cms;

static this() {
  createEntities[DCMSOffer.namespace] = (Json json) => CMSOffer(json); 
  createEntities["cmsOffer"] = (Json json) => CMSOffer(json); 
  createEntities["offer"] = (Json json) => CMSOffer(json); 
}

class DCMSOffer : DCMSPost {
  this() { super(); this.pool("offers"); }
    this(Json newJson) {
        this(); this.fromJson(newJson);
    }

  static string namespace = moduleName!DCMSOffer;
  override string entityPath() { return moduleName!DCMSOffer; }
  override string entityClass() { return "cmsOffer"; }
  override string entityClasses() { return "cmsOffers"; }  

    mixin(SProperty!("UUID", "offer"));

    override void fromJson(Json aJson) {
    if (aJson == Json(null)) return;
    super.fromJson(aJson);
    
    foreach (keyvalue; aJson.byKeyValue) {
      auto k = keyvalue.key;
      auto v = keyvalue.value;
      switch(k) {
        case "offer": this.offer(UUID(v.get!string)); break;
        default: break;
      }      
    }
  }

  override Json toJson(string[] showFields = null, string[] hideFields = null) {    
    auto result = super.toJson(showFields, hideFields);
    
    if (showFields.length == 0) {
      if (!hideFields.exist("offer")) result["offer"] = this.offer.toString;
    }
    else {
      if ((showFields.exist("offer")) && (!hideFields.exist("offer"))) result["offer"] = this.theme.toString;
    }
    
    return result;
  }
}
auto CMSOffer() { return new DCMSOffer; }
auto CMSOffer(Json json) { return new DCMSOffer(json); }
