module models.cms;

public import std.stdio;
public import std.string;
public import std.uuid;

// Dub
public import vibe.d;

public import uim.core;
public import uim.oop;
public import uim.entities;

// public import uim.models;

public import models.cms.classes;
public import models.cms.entities;
public import models.cms.tests;

static this() { // add DCMSBlog to registry
  createEntities[DCMSBlog.namespace] = (Json json) => CMSBlog(json); 
  createEntities["cmsBlog"] = (Json json) => CMSBlog(json); 
  createEntities["blog"] = (Json json) => CMSBlog(json); 
}

static this() { // add CMDDemo to registry
  createEntities[DCMSDemo.namespace] = (Json json) => CMSDemo(json); 
  createEntities["cmsDemo"] = (Json json) => CMSDemo(json); 
  createEntities["demo"] = (Json json) => CMSDemo(json); 
}

static this() {
  createEntities[DCMSDocu.namespace] = (Json json) => CMSDocu(json); 
  createEntities["cmsDocu"] = (Json json) => CMSDocu(json); 
  createEntities["docu"] = (Json json) => CMSDocu(json); 
}

static this() {
  createEntities[DCMSLink.namespace] = (Json json) => CMSLink(json); 
  createEntities["cmsLink"] = (Json json) => CMSLink(json); 
  createEntities["link"] = (Json json) => CMSLink(json); 
}

static this() {
  createEntities[DCMSGlossaryItem.namespace] = (Json json) => CMSGlossaryItem(json); 
  createEntities["cmsGlossaryItem"] = (Json json) => CMSGlossaryItem(json); 
  createEntities["glossaryItem"] = (Json json) => CMSGlossaryItem(json); 
}

static this() {
  createEntities[DCMSNewsItem.namespace] = (Json json) => CMSNewsItem(json); 
  createEntities["cmsNewsItem"] = (Json json) => CMSNewsItem(json); 
  createEntities["newsItem"] = (Json json) => CMSNewsItem(json); 
}

static this() {
  createEntities[DCMSOffer.namespace] = (Json json) => CMSOffer(json); 
  createEntities["cmsOffer"] = (Json json) => CMSOffer(json); 
  createEntities["offer"] = (Json json) => CMSOffer(json); 
}

static this() {
  createEntities[DCMSPage.namespace] = (Json json) => CMSPage(json); 
  createEntities["cmsPage"] = (Json json) => CMSPage(json); 
  createEntities["page"] = (Json json) => CMSPage(json); 
}

static this() {
  createEntities[DCMSTheme.namespace] = (Json json) => CMSTheme(json); 
  createEntities["cmsTheme"] = (Json json) => CMSTheme(json); 
  createEntities["theme"] = (Json json) => CMSTheme(json); 
}

static this() {
  createEntities[DCMSTutorial.namespace] = (Json json) => CMSTutorial(json); 
  createEntities["cmsTutorial"] = (Json json) => CMSTutorial(json); 
  createEntities["tutorial"] = (Json json) => CMSTutorial(json); 
}

static this() {
  uimRegistryEntities
  .register(CMSBlog)
  .register(CMSDemo)
  .register(CMSDocu)
  .register(CMSGlossaryItem)
  .register(CMSLink)
  .register(CMSNewsItem)
  .register(CMSOffer)
  .register(CMSPage)
  .register(CMSTheme)
  .register(CMSTutorial);
}