.class Lh1/e$d;
.super Ljava/lang/Object;
.source "ZteTrackManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lh1/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "d"
.end annotation


# static fields
.field private static final a:Lh1/e;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lh1/e;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lh1/e;-><init>(Lh1/f;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lh1/e$d;->a:Lh1/e;

    .line 8
    .line 9
    return-void
.end method

.method static bridge synthetic a()Lh1/e;
    .locals 1

    .line 1
    sget-object v0, Lh1/e$d;->a:Lh1/e;

    .line 2
    .line 3
    return-object v0
.end method
