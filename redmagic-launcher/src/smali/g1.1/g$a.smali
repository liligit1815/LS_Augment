.class final Lg1/g$a;
.super Ljava/lang/Object;
.source "StaticObjectModule_ProvideGestureExclusionManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lg1/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# static fields
.field private static final a:Lg1/g;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lg1/g;

    .line 2
    .line 3
    invoke-direct {v0}, Lg1/g;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lg1/g$a;->a:Lg1/g;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a()Lg1/g;
    .locals 1

    .line 1
    sget-object v0, Lg1/g$a;->a:Lg1/g;

    .line 2
    .line 3
    return-object v0
.end method
