.class final Lz1/g5$a;
.super Ljava/lang/Object;
.source "WidgetsFilterDataProvider_Factory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/g5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# static fields
.field private static final a:Lz1/g5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lz1/g5;

    .line 2
    .line 3
    invoke-direct {v0}, Lz1/g5;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lz1/g5$a;->a:Lz1/g5;

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a()Lz1/g5;
    .locals 1

    .line 1
    sget-object v0, Lz1/g5$a;->a:Lz1/g5;

    .line 2
    .line 3
    return-object v0
.end method
