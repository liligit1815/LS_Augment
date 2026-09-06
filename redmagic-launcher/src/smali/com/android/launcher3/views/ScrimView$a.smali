.class public interface abstract Lcom/android/launcher3/views/ScrimView$a;
.super Ljava/lang/Object;
.source "ScrimView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/ScrimView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "a"
.end annotation


# virtual methods
.method public a(Landroid/graphics/Canvas;F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p0, p1, p2, v0}, Lcom/android/launcher3/views/ScrimView$a;->b(Landroid/graphics/Canvas;FI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public abstract b(Landroid/graphics/Canvas;FI)V
.end method

.method public c(Landroid/graphics/Canvas;I)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-interface {p0, p1, v0, p2}, Lcom/android/launcher3/views/ScrimView$a;->b(Landroid/graphics/Canvas;FI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
