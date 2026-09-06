.class public final LF4/Z0;
.super Ll4/a;
.source "Unconfined.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LF4/Z0$a;
    }
.end annotation


# static fields
.field public static final i:LF4/Z0$a;


# instance fields
.field public h:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LF4/Z0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LF4/Z0$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LF4/Z0;->i:LF4/Z0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, LF4/Z0;->i:LF4/Z0$a;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll4/a;-><init>(Ll4/g$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
