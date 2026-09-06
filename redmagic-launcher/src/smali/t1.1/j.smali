.class public interface abstract Lt1/j;
.super Ljava/lang/Object;
.source "CachingLogic.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract a(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation
.end method

.method public b(Ljava/lang/Object;Lt1/f;)Ls1/n0;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lt1/f;",
            ")",
            "Ls1/n0;"
        }
    .end annotation

    .line 1
    const-string v0, "cache"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ls1/n0;

    .line 7
    .line 8
    new-instance v2, Lcom/android/launcher3/util/E;

    .line 9
    .line 10
    invoke-interface {p0, p1}, Lt1/j;->h(Ljava/lang/Object;)Landroid/content/ComponentName;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p0, p1}, Lt1/j;->g(Ljava/lang/Object;)Landroid/os/UserHandle;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {v2, v0, v3}, Lcom/android/launcher3/util/E;-><init>(Landroid/content/ComponentName;Landroid/os/UserHandle;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Lt1/f;->w()Ls1/T;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p0, p1, p2}, Lt1/j;->c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const/16 v6, 0x8

    .line 30
    .line 31
    const/4 v7, 0x0

    .line 32
    const/4 v5, 0x0

    .line 33
    move-object v3, p0

    .line 34
    invoke-direct/range {v1 .. v7}, Ls1/n0;-><init>(Lcom/android/launcher3/util/E;Lt1/j;Ljava/lang/String;ZILkotlin/jvm/internal/j;)V

    .line 35
    .line 36
    .line 37
    return-object v1
.end method

.method public abstract c(Ljava/lang/Object;Ls1/T;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ls1/T;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation
.end method

.method public abstract d(Landroid/content/Context;Lt1/f;Ljava/lang/Object;)Ls1/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lt1/f;",
            "TT;)",
            "Ls1/d;"
        }
    .end annotation
.end method

.method public abstract e(Landroid/content/Context;Ljava/lang/Object;)Landroid/graphics/drawable/Drawable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;)",
            "Landroid/graphics/drawable/Drawable;"
        }
    .end annotation
.end method

.method public abstract f(Ljava/lang/Object;)Landroid/content/pm/ApplicationInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/content/pm/ApplicationInfo;"
        }
    .end annotation
.end method

.method public abstract g(Ljava/lang/Object;)Landroid/os/UserHandle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/os/UserHandle;"
        }
    .end annotation
.end method

.method public abstract h(Ljava/lang/Object;)Landroid/content/ComponentName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/content/ComponentName;"
        }
    .end annotation
.end method
