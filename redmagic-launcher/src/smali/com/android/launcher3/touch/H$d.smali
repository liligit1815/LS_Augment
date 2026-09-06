.class public interface abstract Lcom/android/launcher3/touch/H$d;
.super Ljava/lang/Object;
.source "SingleAxisSwipeDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/touch/H;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "d"
.end annotation


# virtual methods
.method public abstract onDrag(F)Z
.end method

.method public onDrag(FFLandroid/view/MotionEvent;)Z
    .locals 0

    .line 2
    invoke-interface {p0, p1, p3}, Lcom/android/launcher3/touch/H$d;->onDrag(FLandroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public onDrag(FLandroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/android/launcher3/touch/H$d;->onDrag(F)Z

    move-result p0

    return p0
.end method

.method public abstract onDragEnd(F)V
.end method

.method public abstract onDragStart(ZF)V
.end method
