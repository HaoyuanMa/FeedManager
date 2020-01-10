
CREATE TABLE category
( 
	ctyid                integer  NOT NULL ,
	ctyname              varchar(20)  NOT NULL ,
	ctynum               integer  NOT NULL ,
	userid               integer  NOT NULL 
)
go



ALTER TABLE category
	ADD CONSTRAINT XPKcategory PRIMARY KEY  CLUSTERED (ctyid ASC,userid ASC)
go



CREATE TABLE favourite
( 
	fvtid                integer  NOT NULL ,
	fvtname              varchar(20)  NOT NULL ,
	fvtnum               integer  NOT NULL ,
	userid               integer  NOT NULL 
)
go



ALTER TABLE favourite
	ADD CONSTRAINT XPKfavourite PRIMARY KEY  CLUSTERED (fvtid ASC,userid ASC)
go



CREATE TABLE userinfo
( 
	userid               integer  NOT NULL ,
	username             varchar(20)  NOT NULL ,
	useremail            varchar(20)  NOT NULL ,
	userpwd              varchar(20)  NOT NULL 
)
go



ALTER TABLE userinfo
	ADD CONSTRAINT XPKuserinfo PRIMARY KEY  CLUSTERED (userid ASC)
go




ALTER TABLE category
	ADD CONSTRAINT R_2 FOREIGN KEY (userid) REFERENCES userinfo(userid)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




ALTER TABLE favourite
	ADD CONSTRAINT R_3 FOREIGN KEY (userid) REFERENCES userinfo(userid)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go




CREATE TRIGGER tD_category ON category FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on category */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* userinfo  category on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012e5b", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="category"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="userid" */
    IF EXISTS (SELECT * FROM deleted,userinfo
      WHERE
        /* %JoinFKPK(deleted,userinfo," = "," AND") */
        deleted.userid = userinfo.userid AND
        NOT EXISTS (
          SELECT * FROM category
          WHERE
            /* %JoinFKPK(category,userinfo," = "," AND") */
            category.userid = userinfo.userid
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last category because userinfo exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg,15,1)
    rollback transaction
END

go


CREATE TRIGGER tU_category ON category FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on category */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insctyid integer, 
           @insuserid integer,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* userinfo  category on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000141c7", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="category"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="userid" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(userid)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,userinfo
        WHERE
          /* %JoinFKPK(inserted,userinfo) */
          inserted.userid = userinfo.userid
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update category because userinfo does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg,15,1)
    rollback transaction
END

go




CREATE TRIGGER tD_favourite ON favourite FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on favourite */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* userinfo  favourite on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012518", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="favourite"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userid" */
    IF EXISTS (SELECT * FROM deleted,userinfo
      WHERE
        /* %JoinFKPK(deleted,userinfo," = "," AND") */
        deleted.userid = userinfo.userid AND
        NOT EXISTS (
          SELECT * FROM favourite
          WHERE
            /* %JoinFKPK(favourite,userinfo," = "," AND") */
            favourite.userid = userinfo.userid
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last favourite because userinfo exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg,15,1)
    rollback transaction
END

go


CREATE TRIGGER tU_favourite ON favourite FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on favourite */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insfvtid integer, 
           @insuserid integer,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* userinfo  favourite on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00013d08", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="favourite"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userid" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(userid)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,userinfo
        WHERE
          /* %JoinFKPK(inserted,userinfo) */
          inserted.userid = userinfo.userid
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update favourite because userinfo does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg,15,1)
    rollback transaction
END

go




CREATE TRIGGER tD_userinfo ON userinfo FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on userinfo */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* userinfo  category on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001d126", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="category"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="userid" */
    IF EXISTS (
      SELECT * FROM deleted,category
      WHERE
        /*  %JoinFKPK(category,deleted," = "," AND") */
        category.userid = deleted.userid
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete userinfo because category exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Trigger */
    /* userinfo  favourite on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="favourite"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userid" */
    IF EXISTS (
      SELECT * FROM deleted,favourite
      WHERE
        /*  %JoinFKPK(favourite,deleted," = "," AND") */
        favourite.userid = deleted.userid
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete userinfo because favourite exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Trigger */
    RETURN
ERROR:
    raiserror (@errmsg,15,1)
    rollback transaction
END

go


CREATE TRIGGER tU_userinfo ON userinfo FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on userinfo */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insuserid integer,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Trigger */
  /* userinfo  category on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001ffd7", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="category"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_2", FK_COLUMNS="userid" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(userid)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,category
      WHERE
        /*  %JoinFKPK(category,deleted," = "," AND") */
        category.userid = deleted.userid
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update userinfo because category exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Trigger */
  /* userinfo  favourite on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="userinfo"
    CHILD_OWNER="", CHILD_TABLE="favourite"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="userid" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(userid)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,favourite
      WHERE
        /*  %JoinFKPK(favourite,deleted," = "," AND") */
        favourite.userid = deleted.userid
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update userinfo because favourite exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
ERROR:
    raiserror (@errmsg,15,1)
    rollback transaction
END

go


