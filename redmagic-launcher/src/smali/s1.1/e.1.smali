.class public interface abstract Ls1/e;
.super Ljava/lang/Object;
.source "BitmapRenderer.java"


# direct methods
.method public static a(IILs1/e;)Landroid/graphics/Bitmap;
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1c
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ls1/e;->b(IILs1/e;)Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static b(IILs1/e;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    invoke-static {}, Ls1/q;->g()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 5
    .line 6
    invoke-static {p0, p1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Landroid/graphics/Canvas;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p2, p1}, Ls1/e;->c(Landroid/graphics/Canvas;)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method


# virtual methods
.method public abstract c(Landroid/graphics/Canvas;)V
.end method
