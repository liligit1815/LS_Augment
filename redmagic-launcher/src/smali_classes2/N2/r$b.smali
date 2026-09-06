.class public final LN2/r$b;
.super Ljava/lang/Object;
.source "DragZone.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN2/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# direct methods
.method public static a(LN2/r;II)Z
    .locals 0

    .line 1
    invoke-interface {p0}, LN2/r;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
