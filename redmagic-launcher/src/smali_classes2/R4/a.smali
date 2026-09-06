.class public final LR4/a;
.super Ljava/lang/Object;
.source "AndroidSchedulers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LR4/a$a;
    }
.end annotation


# direct methods
.method public static a()Lrx/e;
    .locals 1

    .line 1
    invoke-static {}, LQ4/a;->a()LQ4/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, LQ4/a;->b()LQ4/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, LQ4/b;->b()Lrx/e;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    sget-object v0, LR4/a$a;->a:Lrx/e;

    .line 17
    .line 18
    return-object v0
.end method
