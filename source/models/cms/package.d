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

static this() {
  uimRegistryEntities
  .register("cms/blogs", CMSBlog)
  .register("cms/demos", CMSDemo)
  .register("cms/docus", CMSDocu)
  .register("cms/glossary", CMSGlossaryItem)
  .register("cms/links", CMSLink)
  .register("cms/news", CMSNewsItem)
  .register("cms/offers", CMSOffer)
  .register("cms/pages", CMSPage)
  .register("cms/themes", CMSTheme)
  .register("cms/tutorials", CMSTutorial);
}