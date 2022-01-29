module models.cms.entities.link;

@safe:
import models.cms;

class DCMSLink : DCMSPost {
  mixin(OOPEntityThis!("CMSLink"));

  override DOOPEntity clone() { return CMSLink; }
}
mixin(OOPEntityCalls!("CMSLink"));


