module models.cms;

public import std.stdio;
public import std.string;
public import std.uuid;

// Dub
public import vibe.d;

public import uim.core;
public import uim.oop;

// public import uim.models;

public import models.cms.attributes;
public import models.cms.classes;
public import models.cms.entities;
public import models.cms.tests;

static this() {
  EntityRegistry
    .register(CMSBlog, CMSDemo, CMSDocu, CMSGlossaryItem, 
      CMSLink, CMSNewsItem, CMSOffer, CMSPage, CMSTheme, CMSTutorial);
}
