.class public final Lo/h;
.super Ljava/lang/Object;
.source "FloatSet.kt"


# static fields
.field private static final a:Lo/n;

.field private static final b:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lo/n;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lo/n;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lo/h;->a:Lo/n;

    .line 8
    .line 9
    new-array v0, v1, [F

    .line 10
    .line 11
    sput-object v0, Lo/h;->b:[F

    .line 12
    .line 13
    return-void
.end method

.method public static final a()[F
    .locals 1

    .line 1
    sget-object v0, Lo/h;->b:[F

    .line 2
    .line 3
    return-object v0
.end method
