.class public Lk2/a;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# direct methods
.method public static a(Landroid/content/Context;Landroid/graphics/Bitmap;)I
    .locals 0

    .line 1
    invoke-static {p1}, Lb0/b;->b(Landroid/graphics/Bitmap;)Lb0/b$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lb0/b$b;->a()Lb0/b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lb0/b;->f()Lb0/b$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lb0/b$d;->e()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method
