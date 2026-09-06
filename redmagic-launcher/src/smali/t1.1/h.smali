.class public interface abstract Lt1/h;
.super Ljava/lang/Object;
.source "CachedObject.java"


# virtual methods
.method public abstract a()Landroid/content/pm/ApplicationInfo;
.end method

.method public b(Ls1/T;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-interface {p0}, Lt1/h;->a()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Ls1/T;->m(Landroid/content/pm/ApplicationInfo;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public abstract e()Landroid/os/UserHandle;
.end method

.method public abstract g()Landroid/content/ComponentName;
.end method

.method public abstract getLabel()Ljava/lang/CharSequence;
.end method

.method public h(Lt1/f;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
