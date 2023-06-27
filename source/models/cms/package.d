module models.cms;

public import std.stdio;
public import std.string;
public import std.uuid;

// Dub
public import vibe.d;

public import uim.core;
public import uim.oop;
public import uim.models;

// public import uim.models;

public {
  import models.cms.attributes;
  import models.cms.classes;
  import models.cms.elements;
  import models.cms.entities;
  import models.cms.helpers;
  import models.cms.tests;
  import models.cms.usecases;
}

static this() {
  EntityRegistry
    .register(CMSBlog, CMSDemo, CMSDocu, CMSGlossaryItem, 
      CMSLink, CMSNewsItem, CMSOffer, CMSPage, CMSTheme, CMSTutorial);
}
