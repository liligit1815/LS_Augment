.class Lcom/android/launcher3/dragndrop/AddItemActivity$a;
.super Landroid/view/View$DragShadowBuilder;
.source "AddItemActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/dragndrop/AddItemActivity;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Lcom/android/launcher3/dragndrop/AddItemActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onDrawShadow(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onProvideShadowMetrics(Landroid/graphics/Point;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    const/16 p0, 0xa

    .line 2
    .line 3
    invoke-virtual {p1, p0, p0}, Landroid/graphics/Point;->set(II)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x5

    .line 7
    invoke-virtual {p2, p0, p0}, Landroid/graphics/Point;->set(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
