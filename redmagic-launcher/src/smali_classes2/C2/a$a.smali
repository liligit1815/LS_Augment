.class final LC2/a$a;
.super Ljava/lang/Object;
.source "DaggerRemoteUnfoldSharedComponent.java"

# interfaces
.implements LC2/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LC2/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(LC2/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LC2/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;)LC2/c;
    .locals 11

    .line 1
    invoke-static {p1}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    invoke-static {p3}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-static {p4}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-static/range {p5 .. p5}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    invoke-static/range {p6 .. p6}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    invoke-static/range {p7 .. p7}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    invoke-static/range {p8 .. p8}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    new-instance v0, LC2/a$b;

    .line 26
    .line 27
    new-instance v1, LC2/d;

    .line 28
    .line 29
    invoke-direct {v1}, LC2/d;-><init>()V

    .line 30
    .line 31
    .line 32
    const/4 v10, 0x0

    .line 33
    move-object v2, p1

    .line 34
    move-object v3, p2

    .line 35
    move-object v4, p3

    .line 36
    move-object v5, p4

    .line 37
    move-object/from16 v6, p5

    .line 38
    .line 39
    move-object/from16 v7, p6

    .line 40
    .line 41
    move-object/from16 v8, p7

    .line 42
    .line 43
    move-object/from16 v9, p8

    .line 44
    .line 45
    invoke-direct/range {v0 .. v10}, LC2/a$b;-><init>(LC2/d;Landroid/content/Context;LD2/f;Ljava/util/concurrent/Executor;Landroid/os/Handler;Ljava/util/concurrent/Executor;Landroid/os/Handler;Landroid/hardware/display/DisplayManager;Ljava/lang/String;LC2/b;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method
